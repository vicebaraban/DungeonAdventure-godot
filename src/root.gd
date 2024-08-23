extends Node


var Math = preload("res://src/math.gd")
var Inventory = preload("res://src/inventory.gd")


func _ready() -> void:
	Engine.max_fps = 60
	var math = Math.new()
