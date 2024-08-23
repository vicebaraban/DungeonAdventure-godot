extends Sprite2D


func _physics_process(_delta):
	var m_pos = get_global_mouse_position()
	if get_parent().get_parent().position.x > m_pos.x:
		flip_h = true
		position.x = -6
	else:
		flip_h = false
		position.x = 6
