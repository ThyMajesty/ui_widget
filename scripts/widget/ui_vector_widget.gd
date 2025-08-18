@tool
class_name UIVectorWidget
extends UIWidget

var parent_name = "UIVectorWidget"
var label: Label
var spin_box_x: SpinBox
var spin_box_y: SpinBox
var spin_box_z: SpinBox
var spin_box_w: SpinBox

@export var min_value: float = 0
@export var max_value: float = 100
@export var step: float = 0.1

func _ready() -> void:
	scene = preload("../../scenes/widget/ui_vector_widget.tscn")
	label = get_node(parent_name + "/HBoxContainer/Label")
	label.text = view_name
	spin_box_x = get_node(parent_name + "/HBoxContainer/SpinBoxx")
	spin_box_y = get_node(parent_name + "/HBoxContainer/SpinBoxy")
	spin_box_z = get_node(parent_name + "/HBoxContainer/SpinBoxz")
	spin_box_w = get_node(parent_name + "/HBoxContainer/SpinBoxw")
	super._ready()

func _setup_coord(coord: String, _on_changed_coord: Callable) -> void:
	self["spin_box_" + coord] = get_node(parent_name + "/HBoxContainer/SpinBox" + coord)
	self["spin_box_" + coord].min_value = min_value
	self["spin_box_" + coord].max_value = max_value
	self["spin_box_" + coord].step = step
	self["spin_box_" + coord].value = _get_value()[coord]
	self["spin_box_" + coord].value_changed.connect(_on_changed_coord)

func _on_view_name_changed(v) -> void:
	if !label: return
	label.text = v
