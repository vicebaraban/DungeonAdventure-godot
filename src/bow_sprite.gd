extends Sprite2D


func _ready():
	pass

func _physics_process(_delta):
	if get_parent().active:
		visible = true
		var pos = get_node("../../..").position
		rotation_degrees = Math.calculate_angle(pos.x, pos.y,
		get_global_mouse_position().x, get_global_mouse_position().y)
	else:
		visible = false
