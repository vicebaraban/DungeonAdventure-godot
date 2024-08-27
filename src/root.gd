extends Node


var GameMap = preload("res://src/game_map.gd")
var MainMenu = preload("res://src/main_menu.tscn")

var active_level = 1
const max_level = 3


func _ready():
	Engine.max_fps = 60


func _physics_process(_delta):
	pass

func play():
	var gm = GameMap.new(active_level)
	gm.generate_level()
	add_child(gm)
	gm.name = "gm"


func load_main_menu():
	var e = MainMenu.instantiate()
	add_child(e)
	e.name = "main_menu"

