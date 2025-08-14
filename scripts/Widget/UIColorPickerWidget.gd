@tool
class_name UIColorPickerWidget 
extends UIWidget

var color_picker_button: ColorPickerButton
var label: Label

func _get_value():
	return Color(value)

func _set_value(new_value):
	if value == new_value: return
	value = Color(new_value)
	_emit_value_changed(value)
	color_picker_button.color = _get_value()

func _ready() -> void:
	color_picker_button = get_node("HBoxContainer/ColorPickerButton")
	label = get_node("HBoxContainer/Label")
	label.text = view_name
	# color_picker_button.text = view_name
	color_picker_button.color_changed.connect(_set_value)