@tool
class_name UIVector2Widget
extends UIWidget

var label: Label
var spin_box_x: SpinBox
var spin_box_y: SpinBox

@export var min_value: float = 0
@export var max_value: float = 100
@export var step: float = 0.1

func _get_value():
	if value == null: return Vector2(0, 0)
	return value as Vector2

func _set_value(new_value):
	if value == new_value: return
	value = new_value as Vector2
	_emit_value_changed(value)
	spin_box_x.value = _get_value().x
	spin_box_y.value = _get_value().y

func _ready() -> void:
	label = get_node("HBoxContainer/Label")
	label.text = view_name
	spin_box_x = get_node("HBoxContainer/SpinBoxX")
	spin_box_x.min_value = min_value
	spin_box_x.max_value = max_value
	spin_box_x.step = step
	spin_box_y = get_node("HBoxContainer/SpinBoxY")
	spin_box_y.min_value = min_value
	spin_box_y.max_value = max_value
	spin_box_y.step = step
	spin_box_x.value = _get_value().x
	spin_box_y.value = _get_value().y

	spin_box_x.value_changed.connect(_changed_x)
	spin_box_y.value_changed.connect(_changed_y)
	#spin_box_y.value_changed.connect(func(y): _set_value(Vector2(_get_value().x || 0, y)))

func _changed_x(x) -> void:
	_set_value(Vector2(x, _get_value().y))

func _changed_y(y) -> void:
	_set_value(Vector2(_get_value().x, y))
