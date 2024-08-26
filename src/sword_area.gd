extends Area2D


func _physics_process(_delat):
	# print(position)

	for body in get_overlapping_bodies():
		if body.name.left(5) == "enemy" and get_parent().attack:
			body.hit(get_parent().damage)
