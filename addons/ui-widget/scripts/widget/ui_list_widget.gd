@tool
class_name UIListWidget
extends UIWidget

var option_button: OptionButton
var label: Label

func _get_value():
	return int(value)

func _set_value(new_value, emit = true):
	if value == new_value: return
	super._set_value(int(new_value), emit)

func set_items(items):
	for i in items.size():
		option_button.add_icon_item(items[i].texture, items[i].name, i)
	option_button.select(_get_value())

func _ready() -> void:
	scene = preload("../../scenes/widget/ui_list_widget.tscn")
	label = get_node("UIListWidget/HBoxContainer/Label")
	option_button = get_node("UIListWidget/HBoxContainer/OptionButton")
	label.text = view_name
	option_button.item_selected.connect(_set_value)
	super._ready()

func _on_view_name_changed(v) -> void:
	if !label: return
	label.text = v
