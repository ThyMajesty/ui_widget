@tool
class_name UIColorPickerWidget 
extends UIWidget

var color_picker_button: ColorPickerButton
var label: Label

func _get_value():
	return Color(value)

func _set_value(new_value, emit = true):
	if value == new_value: return
	value = Color(new_value)
	super._set_value(new_value, emit)
	color_picker_button.color = _get_value()

func _ready() -> void:
	scene = preload("../../scenes/widget/ui_colorpicker_widget.tscn")
	color_picker_button = get_node("UIColorPickerWidget/HBoxContainer/ColorPickerButton")
	label = get_node("UIColorPickerWidget/HBoxContainer/Label")
	label.text = view_name
	# color_picker_button.text = view_name
	color_picker_button.color_changed.connect(_set_value)
	super._ready()

func _on_view_name_changed(v) -> void:
	if !label: return
	label.text = v
