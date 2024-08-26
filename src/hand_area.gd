extends Area2D


func _physics_process(_delat):
	# print(position)

	for body in get_overlapping_areas():
		if body.name.left(3) == "key" and get_parent().attack:
			get_parent().get_node("hand_audio").play()
			body.queue_free()
			break
		
		elif body.name.left(10) == "power_item" and get_parent().attack:
			get_parent().get_node("hand_audio").play()
			body.queue_free()
			break
