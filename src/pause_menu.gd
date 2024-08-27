extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_b_back_to_menu_pressed():
	visible = false
	get_tree().paused = false
	get_node("..").load_main_menu()
	get_parent().get_node("gm").queue_free()


func _on_b_retry_pressed() -> void:
	visible = false
	get_tree().paused = false
	get_parent().get_node("gm").free()
	get_parent().play()

func _on_b_continue_pressed() -> void:
	visible = false
	get_tree().paused = false
