extends Sprite2D


func _ready():
	pass

func _physics_process(_delta):
	var pos = get_parent().get_parent().position
	rotation_degrees = Math.calculate_angle(pos.x, pos.y,
	 get_global_mouse_position().x, get_global_mouse_position().y)
