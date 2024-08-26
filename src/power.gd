extends Node2D


var active = false
var effect = false

const cooldown = 16.0
var cooldown_delta = 0.0


func set_active(t):
	active = t


func _physics_process(delta):
	if active:
		if Input.is_action_just_pressed("shoot"):
			var Power = load("res://src/power.tscn")
			var e = Power.instantiate()
			e.effect = true
			get_parent().get_parent().add_child(e)
			get_parent().remove_active_item()
	
	if effect:
		get_parent().get_node("inventory/bow").damage = 100
		get_parent().get_node("inventory/sword").damage = 100
		cooldown_delta += delta
		get_parent().get_node("ui/space/power_bar/progress_bar").value = int(cooldown - cooldown_delta)
		if cooldown_delta >= cooldown:
			get_parent().get_node("inventory/bow").damage = 1
			get_parent().get_node("inventory/sword").damage = 3
			queue_free()
