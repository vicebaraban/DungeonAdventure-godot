extends Area2D


func _physics_process(_delat):
	# print(position)

	for body in get_overlapping_bodies():
		if body.name == "enemy" and get_parent().hit:
			body.hit(3)
