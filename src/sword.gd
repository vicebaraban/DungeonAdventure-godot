extends Node2D


var active = false
var hit = false

var cooldown = 1.0
var cooldown_delta = 0.0


func set_active(t):
	active = t


func _physics_process(delta):
	if active:
		cooldown_delta += delta
		position = get_node("../..").position
		if Input.is_action_just_pressed("shoot") and cooldown_delta >= cooldown:
			cooldown_delta = 0.0
			hit = true
		else:
			hit = false

