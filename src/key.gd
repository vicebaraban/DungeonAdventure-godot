extends Node2D


var active = false
var attack = false

var used = false

const cooldown = 1.0
var cooldown_delta = 0.0


func set_active(t):
	active = t


func _physics_process(delta):
	if active:
		cooldown_delta += delta
		position = get_node("../..").position
		if Input.is_action_just_pressed("shoot") and cooldown_delta >= cooldown:
			cooldown_delta = 0.0
			attack = true	
		else:
			attack = false
		
	if used:
		get_parent().remove_active_item()

