@tool
class_name UIIntWidget
extends UIFloatWidget

func _get_value():
	return int(value)

func _set_value(new_value):
	if value == new_value: return
	value = int(new_value)
	_emit_value_changed(value)
	h_slider.value = _get_value()
	spin_box.value = _get_value()
