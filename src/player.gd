extends CharacterBody2D


const speed = 80.0

var durability = 10


func _physics_process(_delta): 
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = velocity.normalized() * speed
	move_and_slide()


func hit(number):
	durability -= number
	get_node("ui/space/hp_bar/progress_bar").value = durability
	get_node("player_audio").play()
