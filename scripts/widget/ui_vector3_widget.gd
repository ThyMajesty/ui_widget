@tool
class_name UIVector3Widget
extends UIVectorWidget

func _get_value():
	if value == null: return Vector3(0, 0, 0)
	return value as Vector3

func _set_value(new_value, emit = true):
	if value == new_value: return
	super._set_value(new_value as Vector3, emit)
	spin_box_x.value = _get_value().x
	spin_box_y.value = _get_value().y
	spin_box_z.value = _get_value().z

func _ready() -> void:
	super._ready()
	_setup_coord("x", _changed_x)
	_setup_coord("y", _changed_y)
	_setup_coord("z", _changed_z)
	spin_box_w.queue_free()
	
func _changed_x(x) -> void:
	_set_value(Vector3(x, _get_value().y, _get_value().z))

func _changed_y(y) -> void:
	_set_value(Vector3(_get_value().x, y, _get_value().z))

func _changed_z(z) -> void:
	_set_value(Vector3(_get_value().x, _get_value().y, z))
