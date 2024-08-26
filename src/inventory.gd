extends Node


var active_position

func _ready():
	active_position = 0
	get_child(active_position).set_active(true)
	get_parent().get_node("ui/space/inventory").select(active_position)


func _physics_process(_delta):
	var ui_i = get_parent().get_node("ui/space/inventory")
	if ui_i.get_selected_items():
		get_child(active_position).set_active(false)
		active_position = ui_i.get_selected_items()[0]
		get_child(active_position).set_active(true)
	if Input.is_action_just_pressed("1"):
		get_child(active_position).set_active(false)
		active_position = 0
		get_child(active_position).set_active(true)
		ui_i.select(active_position)
	elif Input.is_action_just_pressed("2") and get_child_count():
		get_child(active_position).set_active(false)
		active_position = 1
		get_child(active_position).set_active(true)
		ui_i.select(active_position)
	elif Input.is_action_just_pressed("3") and get_child_count():
		get_child(active_position).set_active(false)
		active_position = 2
		get_child(active_position).set_active(true)
		ui_i.select(active_position)
	elif Input.is_action_just_pressed("4") and get_child_count() >= 4:
		get_child(active_position).set_active(false)
		active_position = 3
		get_child(active_position).set_active(true)
		ui_i.select(active_position)
	elif Input.is_action_just_pressed("5") and get_child_count() >= 5:
		get_child(active_position).set_active(false)
		active_position = 4
		get_child(active_position).set_active(true)
		ui_i.select(active_position)
	elif Input.is_action_just_pressed("6") and get_child_count() >= 6:
		get_child(active_position).set_active(false)
		active_position = 5
		get_child(active_position).set_active(true)
		ui_i.select(active_position)
	elif Input.is_action_just_pressed("7") and get_child_count() >= 7:
		get_child(active_position).set_active(false)
		active_position = 6
		get_child(active_position).set_active(true)
		ui_i.select(active_position)
	elif Input.is_action_just_pressed("8") and get_child_count() >= 8:
		get_child(active_position).set_active(false)
		active_position = 7
		get_child(active_position).set_active(true)
		ui_i.select(active_position)
	elif Input.is_action_just_pressed("9") and get_child_count() == 9:
		get_child(active_position).set_active(false)
		active_position = 8
		get_child(active_position).set_active(true)
		ui_i.select(active_position)
	

func add_item(item):
	add_child(item)

func remove_active_item():
	get_child(active_position).queue_free()