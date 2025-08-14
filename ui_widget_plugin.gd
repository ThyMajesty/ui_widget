@tool
extends EditorPlugin

var names = [
	"UIBoolWidget",
	"UIColorPickerWidget",
	"UIFloatWidget",
	"UIIntWidget",
	"UIListWidget",
	"UIVector2Widget"
]

var components = [{
	NODE_NAME = "UIWidget",
	INHERITANCE = "Control",
	THE_SCRIPT = preload("scripts/Widget/UIWidget.gd"),
	THE_ICON = preload("assets/icons/UIWidget.svg")
}]

func _component(name: String) -> Dictionary:
	return {
		NODE_NAME = name,
		INHERITANCE = "UIWidget",
		THE_SCRIPT_PATH = load("scripts/Widget/%s.gd" % name),
		THE_ICON = load("assets/icons/%s.svg" % name)
	}

func _enter_tree() -> void:
	for i in names.size():
		components.append(_component(names[i]))
	for i in components.size():
		add_custom_type(components[i].NODE_NAME, components[i].INHERITANCE, components[i].THE_SCRIPT, components[i].THE_ICON)
	


func _exit_tree() -> void:
	for i in components.size():
		remove_custom_type(components[i].NODE_NAME)
	
