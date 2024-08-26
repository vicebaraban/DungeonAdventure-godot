extends Area2D


var Key = preload("res://src/key.tscn")
var Power = preload("res://src/power.tscn")


func _physics_process(_delat):
	# print(position)

	for body in get_overlapping_areas():
		var p_inv = get_parent().get_parent()
		if body.name.left(8) == "key_item" and get_parent().attack:
			get_parent().get_node("hand_audio").play()
			body.queue_free()
			var e = Key.instantiate()
			p_inv.add_item(e)
		
		elif body.name.left(10) == "power_item" and get_parent().attack:
			get_parent().get_node("hand_audio").play()
			body.queue_free()
			var e = Power.instantiate()
			p_inv.add_item(e)
			get_node("../../..").get_node("ui/space/power_bar/progress_bar").value = 16
