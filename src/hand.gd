extends Node2D


var active = false


func set_active(t):
	active = t


func _physics_process(_delat):
	if false:
		position = get_node("../..").position
		if Input.is_action_just_pressed("shoot"):
			pass

