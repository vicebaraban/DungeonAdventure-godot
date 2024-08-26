extends CharacterBody2D


const speed = 60.0
var durability = 5

var dir = Vector2(0, 0)

var target
var target_is_active = false
var on_target = false
var flag = false

const cooldown = 1.5
var cooldown_delta = 0.0


func _physics_process(delta):
	cooldown_delta += delta
	target = get_parent().get_node("player").global_position
	# print(Math.hypotenuse(target.x, target.y, global_position.x, global_position.y))
	if Math.hypotenuse(target.x, target.y, global_position.x, global_position.y) <= 120:
		target_is_active = true
	else:
		target_is_active = false
	
	if target_is_active and !on_target:
		if target.x < global_position.x:
			dir.x = -1
		elif target.x > global_position.x:
			dir.x = 1
		else:
			dir.x = 0
		if target.y < global_position.y:
			dir.y = -1
		elif target.y > global_position.y:
			dir.y = 1
		else:
			dir.y = 0
	else:
		dir.x = 0
		dir.y = 0
	
	velocity = dir * speed

	var colission = move_and_slide()
	on_target = false
	if colission:
		for i in get_slide_collision_count():
			var contact = get_slide_collision(i)
			if contact.get_collider().name.left(6) == "player":
				on_target = true
				flag = true
				if cooldown_delta >= cooldown:
					cooldown_delta = 0.0
					attack(contact)

func hit(number):
	durability -= number
	var rv = randi() % 4 + 1
	get_node("EnemyHit" + str(rv)).play()
	if durability <= 0:
		rv = randi() % 3 + 1
		get_parent().get_node("player/enemy_die_" + str(rv) + "_audio").play()
		queue_free()

func attack(contact):
	contact.get_collider().hit(1)
