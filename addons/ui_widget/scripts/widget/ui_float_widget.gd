@tool
class_name UIFloatWidget
extends UINumberWidget

func _get_value():
	return float(value)

func _set_value(new_value, emit = true):
	if value == new_value: return
	super._set_value(float(new_value), emit)
	h_slider.value = _get_value()
	spin_box.value = _get_value()
