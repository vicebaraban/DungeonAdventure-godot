extends Node


var active_position

func _ready():
	active_position = 2


func _physics_process(_delta):
	for i in range(get_child_count()):
		if i == active_position:
			get_child(i).set_active(true)
		else:
			get_child(i).set_active(false)
