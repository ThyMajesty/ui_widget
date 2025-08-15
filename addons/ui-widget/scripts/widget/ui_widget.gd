@tool
class_name UIWidget
extends BoxContainer

signal value_changed(new_value)

var scene:
	set(v):
		scene = v
		add_child(scene.instantiate())

# Property name - used internally 
@export var property_name: String:
	set(v):
		if property_name == v: return
		property_name = v
		_on_property_name_changed(property_name)

# Displayed name
@export var view_name: String:
	set(v):
		if view_name == v: return
		view_name = v
		_on_view_name_changed(view_name)

@export var debounce: bool = true
@export var debounce_time: float = 0.1

var debounce_timer: SceneTreeTimer
var value

# Overridable - called on property_name change
func _on_property_name_changed(v) -> void:
	pass

# Overridable - called on view_name change
func _on_view_name_changed(v) -> void:
	pass

# Overridable - used to set type and modify value
func _set_value(new_value, emit = true) -> void:
	if value == new_value: return
	value = new_value
	if emit: _emit_value_changed()

# Overridable
func _get_value():
	return value

# Handles actual _set_value with debounce
func _emit_value_changed():
	print("_emit_value_changed")
	if !debounce: 
		value_changed.emit(value)
	if debounce_timer:
		debounce_timer.timeout.disconnect(value_changed.emit)
		debounce_timer = null
	debounce_timer = get_tree().create_timer(debounce_time)
	debounce_timer.timeout.connect(value_changed.emit.bind(value))

# view_name and property_name are taken from the Node name or changed via editor.
# super._ready called after child's _ready to ensure everything's been initialized 
func _ready() -> void:
	add_to_group("UIWidget")
	_on_renamed()
	renamed.connect(_on_renamed)

func _on_renamed() -> void:
	property_name = get_name().to_snake_case()
	view_name = get_name().replace("_", " ").capitalize()
