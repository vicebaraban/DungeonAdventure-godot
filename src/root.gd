extends Node


var GameMap = preload("res://src/game_map.gd")


func _ready():
	Engine.max_fps = 60
	var gm = GameMap.new(1)
	gm.generate_level()
	add_child(gm)
	get_node("playing_audio").play()


func _on_finished():
	pass

