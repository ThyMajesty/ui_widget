@tool
class_name UIFloatWidget 
extends UIWidget

var h_slider: HSlider
var spin_box: SpinBox
var label: Label

@export var min_value: float = 0
@export var max_value: float = 100
@export var step: float = 1

func _get_value():
	return float(value)

func _set_value(new_value):
	if value == new_value: return
	value = float(new_value)
	_emit_value_changed(value)
	h_slider.value = _get_value()
	spin_box.value = _get_value()

func _ready() -> void:
	value = 0
	h_slider = get_node("HBoxContainer/HSlider") as HSlider
	spin_box = get_node("HBoxContainer/SpinBox") as SpinBox
	label = get_node("HBoxContainer/Label") as Label

	label.text = view_name

	h_slider.value_changed.connect(_set_value)
	h_slider.min_value = min_value
	h_slider.max_value = max_value
	h_slider.step = step
	h_slider.value = _get_value()

	spin_box.value_changed.connect(_set_value)
	spin_box.min_value = min_value
	spin_box.max_value = max_value
	spin_box.step = step
	spin_box.value = _get_value()
