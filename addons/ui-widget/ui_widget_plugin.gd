@tool
extends EditorPlugin

var components = [ {
	NODE_NAME = "UIWidget",
	INHERITANCE = "BoxContainer",
	THE_SCRIPT = preload("scripts/widget/ui_widget.gd"),
	THE_ICON = preload("assets/icons/ui_widget.svg"),
}, {
	NODE_NAME = "UIBoolWidget",
	INHERITANCE = "UIWidget",
	THE_SCRIPT = preload("scripts/widget/ui_bool_widget.gd"),
	THE_ICON = preload("assets/icons/ui_bool_widget.svg"),
}, {
	NODE_NAME = "UIColorPickerWidget",
	INHERITANCE = "UIWidget",
	THE_SCRIPT = preload("scripts/widget/ui_colorpicker_widget.gd"),
	THE_ICON = preload("assets/icons/ui_colorpicker_widget.svg"),
}, {
	NODE_NAME = "UIFloatWidget",
	INHERITANCE = "UIWidget",
	THE_SCRIPT = preload("scripts/widget/ui_float_widget.gd"),
	THE_ICON = preload("assets/icons/ui_float_widget.svg"),
}, {
	NODE_NAME = "UIIntWidget",
	INHERITANCE = "UIFloatWidget",
	THE_SCRIPT = preload("scripts/widget/ui_int_widget.gd"),
	THE_ICON = preload("assets/icons/ui_int_widget.svg"),
}, {
	NODE_NAME = "UIListWidget",
	INHERITANCE = "UIWidget",
	THE_SCRIPT = preload("scripts/widget/ui_list_widget.gd"),
	THE_ICON = preload("assets/icons/ui_list_widget.svg"),
}, {
	NODE_NAME = "UIVectorWidget",
	INHERITANCE = "UIWidget",
	THE_SCRIPT = preload("scripts/widget/ui_vector_widget.gd"),
	THE_ICON = preload("assets/icons/ui_vector_widget.svg"),
}, {
	NODE_NAME = "UIVector2Widget",
	INHERITANCE = "UIVectorWidget",
	THE_SCRIPT = preload("scripts/widget/ui_vector2_widget.gd"),
	THE_ICON = preload("assets/icons/ui_vector2_widget.svg"),
}, {
	NODE_NAME = "UIVector3Widget",
	INHERITANCE = "UIVectorWidget",
	THE_SCRIPT = preload("scripts/widget/ui_vector3_widget.gd"),
	THE_ICON = preload("assets/icons/ui_vector3_widget.svg"),
}, {
	NODE_NAME = "UIVector4Widget",
	INHERITANCE = "UIVectorWidget",
	THE_SCRIPT = preload("scripts/widget/ui_vector4_widget.gd"),
	THE_ICON = preload("assets/icons/ui_vector4_widget.svg"),
}]

func _enter_tree() -> void:
	for i in components.size():
		add_custom_type(components[i].NODE_NAME, components[i].INHERITANCE, components[i].THE_SCRIPT, components[i].THE_ICON)

func _exit_tree() -> void:
	for i in components.size():
		remove_custom_type(components[i].NODE_NAME)
