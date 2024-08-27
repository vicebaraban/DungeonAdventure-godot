extends Control


func _on_b_back_to_menu_pressed():
	visible = false
	get_tree().paused = false
	get_node("..").load_main_menu()
	get_parent().get_node("gm").queue_free()


func _on_b_retry_pressed():
	visible = false
	get_tree().paused = false
	get_parent().get_node("gm").free()
	get_parent().play()
	

func _on_b_continue_pressed():
	visible = false
	get_tree().paused = false
