extends Area2D


func _physics_process(_delta):
	for body in get_overlapping_areas():
		if body.name.left(6) == "finish" and get_parent().attack:
			body.durability -= 1
			get_parent().used = true
