extends Control


func _on_b_back_to_menu_pressed():
	visible = false
	get_node("..").load_main_menu()


func _on_b_retry_pressed():
	visible = false
	get_parent().play()
