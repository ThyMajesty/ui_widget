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

func _set_value(new_value, emit = true):
	if value == new_value: return
	value = new_value as Vector2
	super._set_value(new_value, emit)
	spin_box_x.value = _get_value().x
	spin_box_y.value = _get_value().y

func _ready() -> void:
	scene = preload("../../scenes/widget/ui_vector2_widget.tscn")
	label = get_node("UIVector2Widget/HBoxContainer/Label")
	label.text = view_name
	spin_box_x = get_node("UIVector2Widget/HBoxContainer/SpinBoxX")
	spin_box_x.min_value = min_value
	spin_box_x.max_value = max_value
	spin_box_x.step = step
	spin_box_y = get_node("UIVector2Widget/HBoxContainer/SpinBoxY")
	spin_box_y.min_value = min_value
	spin_box_y.max_value = max_value
	spin_box_y.step = step
	spin_box_x.value = _get_value().x
	spin_box_y.value = _get_value().y

	spin_box_x.value_changed.connect(_changed_x)
	spin_box_y.value_changed.connect(_changed_y)
	super._ready()

func _changed_x(x) -> void:
	_set_value(Vector2(x, _get_value().y))

func _changed_y(y) -> void:
	_set_value(Vector2(_get_value().x, y))

func _on_property_name_changed(v) -> void:
	label.text = v
