extends Node2D


var Bullet = preload("res://src/bullet.tscn")


func _physics_process(_delat):
	if Input.is_action_just_pressed("shoot"):
		var b = Bullet.instantiate()
		b.settings(get_parent().position, get_global_mouse_position())
		get_tree().get_root().add_child(b)

