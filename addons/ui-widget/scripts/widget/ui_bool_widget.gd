@tool
class_name UIBoolWidget
extends UIWidget

var check_button: CheckButton
var label: Label

func _get_value():
	return bool(value)

func _set_value(new_value, emit = true):
	if value == new_value: return
	super._set_value(bool(new_value), emit)
	check_button.button_pressed = _get_value()

func _ready() -> void:
	scene = preload("../../scenes/widget/ui_bool_widget.tscn")
	check_button = get_node("UIBoolWidget/HBoxContainer/CheckButton")
	check_button.toggled.connect(_set_value)
	label = get_node("UIBoolWidget/HBoxContainer/Label")
	label.text = view_name
	super._ready()

func _on_view_name_changed(v) -> void:
	if !label: return
	label.text = v
