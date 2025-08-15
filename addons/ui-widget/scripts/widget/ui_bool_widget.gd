@tool
class_name UIBoolWidget
extends UIWidget

var check_button: CheckButton

func _get_value():
	return bool(value)

func _set_value(new_value, emit = true):
	if value == new_value: return
	value = bool(new_value)
	super._set_value(new_value, emit)
	check_button.button_pressed = _get_value()

func _ready() -> void:
	scene = preload("../../scenes/widget/ui_bool_widget.tscn")
	check_button = get_node("UIBoolWidget/HBoxContainer/CheckButton")
	check_button.text = view_name
	check_button.toggled.connect(_set_value)
	super._ready()

func _on_property_name_changed(v) -> void:
	check_button.text = v
