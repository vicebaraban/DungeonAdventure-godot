extends CharacterBody2D


const speed = 80.0

var durability = 10


func _ready(): 
	get_node("playing_audio").play()
	get_node("start_playing_audio").play()


func _physics_process(_delta): 
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = velocity.normalized() * speed
	move_and_slide()
	if Input.is_action_just_pressed("pause"):
		get_node("../camera").global_position = Vector2(400, 300)
		get_tree().paused = true
		get_node("../../pause_menu").visible = true


func hit(number):
	durability -= number
	get_node("ui/space/hp_bar/progress_bar").value = durability
	get_node("player_audio").play()
	if durability <= 0:
		get_node("../../lose_menu").visible = true
		get_node("../../lose_menu/lose_sound").play()
		get_parent().queue_free()
