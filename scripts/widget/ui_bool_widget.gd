@tool
class_name UIBoolWidget
extends UIWidget

var check_button: CheckButton

func _get_value():
	return bool(value)

func _set_value(new_value):
	if value == new_value: return
	value = bool(new_value)
	_emit_value_changed(value)
	check_button.button_pressed = _get_value()

func _ready() -> void:
	check_button = get_node("HBoxContainer/CheckButton")
	check_button.text = view_name
	check_button.toggled.connect(_set_value)
