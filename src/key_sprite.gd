extends Sprite2D


func _ready():
	pass

func _physics_process(_delta):
	if get_parent().active:
		visible = true
	else:
		visible = false
