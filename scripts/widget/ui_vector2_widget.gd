@tool
class_name UIVector2Widget
extends UIVectorWidget

func _get_value():
	if value == null: return Vector2(0, 0)
	return value as Vector2

func _set_value(new_value, emit = true):
	if value == new_value: return
	super._set_value(new_value as Vector2, emit)
	spin_box_x.value = _get_value().x
	spin_box_y.value = _get_value().y

func _ready() -> void:
	super._ready()
	_setup_coord("x", _changed_x)
	_setup_coord("y", _changed_y)
	spin_box_z.queue_free()
	spin_box_w.queue_free()
	

func _changed_x(x) -> void:
	_set_value(Vector2(x, _get_value().y))

func _changed_y(y) -> void:
	_set_value(Vector2(_get_value().x, y))
