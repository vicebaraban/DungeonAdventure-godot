extends Control


func _ready():
	get_node("levels").select(get_parent().active_level - 1)


func _on_levels_item_selected(index):
	get_parent().active_level = index + 1
	print(1)


func _on_b_menu_pressed():
	visible = false
	get_node("../main_menu").visible = true
