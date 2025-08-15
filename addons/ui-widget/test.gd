class_name Test
extends Node

var widget_nodes: Array
var widget_dict: Dictionary

var test_values:= TestValues.new()

func _ready() -> void:
	print("test _ready")

	# Get all the Widgets via group
	widget_nodes = get_tree().get_nodes_in_group("UIWidget")
	print(widget_nodes)
	for uiw_node in widget_nodes:
		print(uiw_node)
		print(uiw_node is UIWidget)
		if uiw_node is UIWidget:
			var key = uiw_node.property_name
			print(key)
			widget_dict[key] = uiw_node
			widget_dict[key].value_changed.connect(_value_changed.bind(key))
			widget_dict[key]._set_value(test_values[key])

func _value_changed(value, key: String) -> void:
	print("_value_changed " + key)
	print(value)

class TestValues:
	var bool_value:= true
	var float_value:= 66.6
	var int_value:= 66
	var vector_value:= Vector2(0.1, 12.2)
	var color_value:= Color(0.2, 0.5, 0.2, 0.7)
