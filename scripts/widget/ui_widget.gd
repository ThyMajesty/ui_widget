@tool
class_name UIWidget
extends Control

@export var property_name: String:
	get:
		if !property_name:
			property_name = get_name()
		return property_name
@export var debounce: bool = true
@export var debounce_time: float = 0.1

# Displayed name
@export var view_name: String:
	get:
		if !view_name:
			view_name = view_name.replace("_", " ").capitalize()
		if !view_name:
			view_name = property_name.replace("_", " ").capitalize()
		return view_name
var value

# Overridable
func _set_value(new_value) -> void:
	_emit_value_changed(value)

# Overridable
func _get_value():
	return value

var debounce_timer: SceneTreeTimer
signal value_changed(new_value)

# Handles acctual _set_value with debounce
func _emit_value_changed(new_value):
	if value == new_value: return
	value = new_value
	if !debounce: 
		value_changed.emit(value)
	if debounce_timer:
		debounce_timer.timeout.disconnect(value_changed.emit)
		debounce_timer = null
	debounce_timer = get_tree().create_timer(debounce_time)
	debounce_timer.timeout.connect(value_changed.emit.bind(value))

# name is taken from the Node name or changed via editor
func _ready() -> void:
	property_name = property_name
	print(property_name)
	view_name = view_name
