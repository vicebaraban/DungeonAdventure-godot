extends Area2D


var durability = 2

var openned = false

const open_cooldown = 1.2
var open_cooldown_delta = 0.0


func _physics_process(delta):
	if durability <= 0 and !openned:
		get_node("finish_1_sprite").visible = false
		get_node("finish_2_sprite").visible = true
		openned = true
	if openned:
		open_cooldown_delta += delta
		if open_cooldown <= open_cooldown_delta:
			get_node("../../victory_menu").visible = true
			get_node("../../victory_menu/victory_sound").play()
			get_parent().queue_free()