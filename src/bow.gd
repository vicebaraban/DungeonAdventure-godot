extends Node2D


var Bullet = preload("res://src/bullet.tscn")

var active = false

const cooldown = 1.0
var cooldown_delta = 0.0

var damage = 1


func set_active(t):
	active = t


func _physics_process(delta):
	if active:
		position = get_node("../..").position
		cooldown_delta += delta
		if Input.is_action_just_pressed("shoot") and cooldown_delta >= cooldown:
			cooldown_delta = 0.0
			var b = Bullet.instantiate()
			b.damage = damage
			b.settings(get_node("../..").position, get_global_mouse_position())
			get_tree().get_root().add_child(b)
			get_node("bow_audio").play()

