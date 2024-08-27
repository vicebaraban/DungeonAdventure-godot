extends Control


func _on_b_back_to_menu_pressed():
	visible = false
	get_node("..").load_main_menu()

func _on_b_next_pressed():
	visible = false
	if get_parent().max_level > get_parent().active_level:
		get_parent().active_level += 1
	get_parent().play()
