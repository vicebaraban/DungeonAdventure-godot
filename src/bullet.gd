extends CharacterBody2D


const speed = 120.0	
var dir = Vector2(0, 0)
var angle


func settings(pos, target):
	position = pos
	dir = Math.calculate_direction(pos.x, pos.y, target.x, target.y)
	angle = Math.calculate_angle(pos.x, pos.y, target.x, target.y)


func _physics_process(_delta):
	velocity = dir * speed
	var colission = move_and_slide()
	var destroy = false
	if colission:
		for i in get_slide_collision_count():
			var contact = get_slide_collision(i)
			if contact.get_collider().name.left(5) == "enemy":
				contact.get_collider().hit(1)
				destroy = true
				break
			if contact.get_collider().name.left(4) == "wall":
				destroy = true
		if destroy:
			queue_free()

	# if colission:
	# 	for contact in colission:
	# 		print(contact.name)
