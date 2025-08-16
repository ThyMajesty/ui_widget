class_name Test
extends Node

var widget_nodes: Array
var widget_dict: Dictionary

var test_values := TestValues.new()

@export var texture_array: Array[Texture2D]:
	set = set_textures

func set_textures(v) -> void:
	texture_array = v
	for i in min(texture_array.size(), test_values.textured_list_items.size()):
		test_values.textured_list_items[i].texture = texture_array[i]

func _ready() -> void:
	print("test _ready")
	set_textures(texture_array)
	# Get all the Widgets via group
	widget_nodes = get_tree().get_nodes_in_group("UIWidget")
	# Custom grouping
	widget_nodes.append_array(get_tree().get_nodes_in_group("UIWidget1"))
	for uiw_node in widget_nodes:
		if uiw_node is UIWidget:
			var property_name = uiw_node.property_name
			var node_name = uiw_node.get_name()
			var dict_key = property_name + node_name
			print(property_name)
			widget_dict[dict_key] = uiw_node
			widget_dict[dict_key].value_changed.connect(test_values._value_changed.bind(property_name, true))
			widget_dict[dict_key]._set_value(test_values[property_name])
			test_values.value_changed.connect(func(new_value: Variant, key: String): if property_name == key: widget_dict[dict_key]._set_value(new_value, true))
			if property_name == "list_value": widget_dict[dict_key].set_items(test_values.list_items)
			if property_name == "textured_list_value": widget_dict[dict_key].set_items(test_values.textured_list_items)

class TestValues:
	signal value_changed(new_value: Variant, key: String)

	var bool_value := true
	var float_value := 66.6
	var int_value := 66
	var vector_2_value := Vector2(0.1, 12.2)
	var vector_3_value := Vector3(0.1, 12.2, 24.6)
	var vector_4_value := Vector4(0.1, 12.2, 24.6, 56.4)
	var color_value := Color(0.2, 0.5, 0.2, 0.7)
	var list_value := 1
	var textured_list_value := 1

	var list_items = [{
		name = "Laugh"
	}, {
		name = "Live"
	}, {
		name = "Love"
	},]

	var textured_list_items = [{
		texture = null,
		name = "Laugh"
	}, {
		texture = null,
		name = "Live"
	}, {
		texture = null,
		name = "Love"
	},]

	func _value_changed(value, key: String, emit = true) -> void:
		if self[key] == value: return
		self[key] = value
		print("_value_changed " + str(key) + " " + str(value) + " | emit: " + str(emit))
		if emit: value_changed.emit(value, key)
