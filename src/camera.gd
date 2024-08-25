extends Camera2D


func _process(_delta):
	var target = get_parent().get_node("player")
	if target:
		global_position = target.global_position
