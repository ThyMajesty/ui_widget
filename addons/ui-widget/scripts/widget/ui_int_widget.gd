@tool
class_name UIIntWidget
extends UINumberWidget

func _get_value():
	return int(value)

func _set_value(new_value, emit = true):
	if value == new_value: return
	super._set_value(int(new_value), emit)
	h_slider.value = _get_value()
	spin_box.value = _get_value()
