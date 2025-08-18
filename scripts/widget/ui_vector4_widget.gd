@tool
class_name UIVector4Widget
extends UIVectorWidget

func _get_value():
	if value == null: return Vector4(0, 0, 0, 0)
	return value as Vector4

func _set_value(new_value, emit = true):
	if value == new_value: return
	super._set_value(new_value as Vector4, emit)
	spin_box_x.value = _get_value().x
	spin_box_y.value = _get_value().y
	spin_box_z.value = _get_value().z
	spin_box_w.value = _get_value().w

func _ready() -> void:
	super._ready()
	_setup_coord("x", _changed_x)
	_setup_coord("y", _changed_y)
	_setup_coord("z", _changed_z)
	_setup_coord("w", _changed_w)
	
func _changed_x(x) -> void:
	_set_value(Vector4(x, _get_value().y, _get_value().z, _get_value().w))

func _changed_y(y) -> void:
	_set_value(Vector4(_get_value().x, y, _get_value().z, _get_value().w))

func _changed_z(z) -> void:
	_set_value(Vector4(_get_value().x, _get_value().y, z, _get_value().w))
	
func _changed_w(w) -> void:
	_set_value(Vector4(_get_value().x, _get_value().y, _get_value().z, w))
