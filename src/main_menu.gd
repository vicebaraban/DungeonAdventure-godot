extends Control


func _on_b_exit_pressed():
	get_tree().quit()


func _on_b_play_pressed():
	get_parent().play()
	queue_free()


func _on_b_level_pressed():
	visible = false
	get_node("../level_menu").visible = true
