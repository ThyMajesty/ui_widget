@tool
class_name UIWidget
extends BoxContainer
## Parent class for all the Widgets
##
## Handles grouping, renaming, debounce and emitting [signal value_changed]
##
## @tutorial:             https://github.com/ThyMajesty/ui_widget/blob/master/readme.md

## A signal emitted on value change
signal value_changed(new_value)

## [b]Group Name[/b] - applied per specific Node instance
@export var group_name = "UIWidget":
	set(v):
		if v.is_empty(): return
		remove_from_group(group_name)
		group_name = v
		add_to_group(group_name)

## [b]Scene[/b] - used to override Node instance's scene. Please refer to corresponding scene file to see the correct structure and naming 
@export var scene: PackedScene:
	set(v):
		if scene == v: return
		if is_instance_valid(scene_instance):
			scene_instance.queue_free()
		scene = v
		scene_instance = scene.instantiate()
		add_child(scene_instance)

## Instance of the scene. Used internally
var scene_instance

## [b]Property Name[/b] - a [String] that is populated automatically on [method _ready] and changed on node rename from the Editor.
## If set from Editor value will not be changed automatically anymore. Made for utility and identification. Usage: [Class UIWidgetTest]
@export var property_name: String:
	set(v):
		if property_name == v: return
		property_name = v
		_on_property_name_changed(property_name)

## [b]View Name[/b] - a [String] that is populated automatically on [method _ready] and changed on node rename from the Editor.
## If set from Editor value will not be changed automatically anymore. Used for populating [member Label.text]
@export var view_name: String:
	set(v):
		if view_name == v: return
		view_name = v
		_on_view_name_changed(view_name)

## [b]Debounce[/b] - defines whether debounce is applied or not. Is set per Node instance
@export var debounce: bool = true

## [b]Debounce Time[/b] - defines debounce time in seconds. Is set per Node instance
@export var debounce_time: float = 0.1

var debounce_timer: SceneTreeTimer

## Actual value
var value

## Called on property_name change
func _on_property_name_changed(v) -> void:
	pass

## Called on view_name change
func _on_view_name_changed(v) -> void:
	pass

## Used to set type, modify value and set it from outside. Calls [method _emit_value_changed] if [member emit] is set to true.
func _set_value(new_value, emit = true) -> void:
	if value == new_value: return
	value = new_value
	if emit: _emit_value_changed()

## Returns value. Can be used to modify value before emitting value_changed
func _get_value():
	return value

## Handles [member debounce] and [signal value_changed]
func _emit_value_changed():
	if !debounce:
		value_changed.emit(_get_value())
	if debounce_timer:
		debounce_timer.timeout.disconnect(value_changed.emit)
		debounce_timer = null
	debounce_timer = get_tree().create_timer(debounce_time)
	debounce_timer.timeout.connect(value_changed.emit.bind(_get_value()))

## [member property_name] and [member view_name] are set from the Node name or changed via editor.
## [member super._ready] is called after child's [member _ready] to ensure everything's been initialized 
func _ready() -> void:
	add_to_group(group_name)
	if property_name.is_empty(): property_name = get_name().to_snake_case()
	if view_name.is_empty(): view_name = get_name().replace("_", " ").capitalize()
	renamed.connect(_on_renamed)

## Called on Node rename in the Editor. Set [member property_name] and [member view_name] regardless whether those properties being set previously
func _on_renamed() -> void:
	if !Engine.is_editor_hint(): return
	property_name = get_name().to_snake_case()
	view_name = get_name().replace("_", " ").capitalize()
