@tool
class_name UIListWidget
extends UIWidget

var option_button: OptionButton
var label: Label

func _get_value():
	return int(value)

func _set_value(new_value):
	if value == new_value: return
	value = int(new_value)
	_emit_value_changed(value)

func set_items(items):
	for i in items.size():
		option_button.add_icon_item(items[i].texture, items[i].name, i)
	option_button.select(_get_value())

func _ready() -> void:
	label = get_node("HBoxContainer/Label")
	option_button = get_node("HBoxContainer/OptionButton")
	label.text = view_name
	option_button.item_selected.connect(_set_value)
	

	
