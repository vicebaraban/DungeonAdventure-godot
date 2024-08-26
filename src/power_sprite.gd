extends Sprite2D


func _ready():
	pass

func _physics_process(_delta):
	if get_parent().effect:
		visible = true
	else:
		visible = false
