extends CharacterBody2D


const speed = 80.0

func _physics_process(_delta): 
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = velocity.normalized() * speed
	move_and_slide()
