extends CharacterBody2D


const speed = 120.0	
var dir
var angle


func settings(pos, target):
	position = pos
	dir = Math.calculate_direction(pos.x, pos.y, target.x, target.y)
	angle = Math.calculate_angle(pos.x, pos.y, target.x, target.y)


func _physics_process(_delta):
	velocity = dir * speed
	move_and_slide()
