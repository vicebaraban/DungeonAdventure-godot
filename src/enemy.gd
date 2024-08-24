extends CharacterBody2D


const speed = 20.0
var durability = 5


func _physics_process(_delta):
	move_and_slide()

func hit(number):
	# print(durability)
	durability -= number
	if durability <= 0:
		queue_free()
