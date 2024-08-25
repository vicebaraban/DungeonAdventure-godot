extends Sprite2D


func _physics_process(_delta):
	if get_parent().target_is_active:
		if global_position.x > get_parent().target.x:
			flip_h = true
		else:
			flip_h = false
