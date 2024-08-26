extends Node


var Player = preload("res://src/player.tscn")
var Enemy = preload("res://src/enemy.tscn")
var Wall = preload("res://src/wall.tscn")
var Camera = preload("res://src/camera.gd")
var Finish = preload("res://src/finish.tscn")
var Key = preload("res://src/key.tscn")
var PowerItem = preload("res://src/power_item.tscn")

var floor_texture = preload("res://resources/textures/floor.png")
var door_opened_texture = preload("res://resources/textures/door_opened.png")


var level
const tile_size = 50

var level_map = []


func _init(lvl):
	level = lvl
	var file = FileAccess.open("res://resources/maps/map" + str(level) + ".txt", FileAccess.READ)
	while !file.eof_reached():
		var line = file.get_line()
		level_map.append(line.strip_edges())
	var max_width = 0
	for line in level_map:
		if line.length() > max_width:
			max_width = line.length()
	for i in range(level_map.size()):
		var diff = max_width - level_map[i].length()
		if diff > 0:
			level_map[i] += ".".repeat(diff)


func _ready():
	pass


func _process(_delta):
	pass

func generate_level():
	for y in range(level_map.size()):
		for x in range(level_map[y].length()):
			var p = level_map[y][x]
			var t = Vector2(x, y) * 50
			if p == ".":
				pass
			elif p == "#":
				var e = Wall.instantiate()
				e.global_position = t
				add_child(e)
				e.name = "wall"
			elif p == "_":
				var e = Sprite2D.new()
				e.texture = floor_texture
				e.global_position = t
				add_child(e)
				e.name = "floor"
			elif p == "A":
				var e = Sprite2D.new()
				e.texture = floor_texture
				e.global_position = t
				add_child(e)
				e.name = "floor"
				var e1 = Sprite2D.new()
				e1.texture = door_opened_texture
				e1.global_position = t
				add_child(e1)
				e1.name = "door_1"
				var e2 = Player.instantiate()
				e2.global_position = t
				add_child(e2)
				e2.name = "player"
				add_child(Camera.new())
			elif p == "B":
				var e = Sprite2D.new()
				e.texture = floor_texture
				e.global_position = t
				add_child(e)
				e.name = "floor"
				var e1 = Finish.instantiate()
				e1.global_position = t
				add_child(e1)
				e1.name = "finish"
			elif p == "?":
				var e = Sprite2D.new()
				e.texture = floor_texture
				e.global_position = t
				add_child(e)
				e.name = "floor"
				var e1 = Key.instantiate()
				e1.global_position = t
				add_child(e1)
				e1.name = "key"
			elif p == "!":
				var e = Sprite2D.new()
				e.texture = floor_texture
				e.global_position = t
				add_child(e)
				e.name = "floor"
				var e1 = Enemy.instantiate()
				e1.global_position = t
				# e.name = "enemy"
				add_child(e1)
				e1.name = "enemy"
			elif p == "R":
				var e = Sprite2D.new()
				e.texture = floor_texture
				e.global_position = t
				add_child(e)
				e.name = "floor"
				var e1 = PowerItem.instantiate()
				e1.global_position = t
				add_child(e1)
				e1.name = "power_item"
			


# func generate_level():
#     for y in range(level_map.size()):
#         for x in range(level_map[y].size()):
#             if level_map[y][x] == '.':
#                 pass
#             elif level_map[y][x] == '#':
#                 pass
#                 # engine_main.Tile(game_data.images['wall'], (x, y), _tile_sprites, _impenetrable)
#             elif level_map[y][x] == '_':
#                 pass
#                 # engine_main.Tile(game_data.images['floor'], (x, y), _tile_sprites)
#             elif level_map[y][x] == 'A':
#                 pass
#                 # engine_main.Tile(game_data.images['floor'], (x, y), _tile_sprites)
#                 # Door(game_data.images['door_opened'], (x, y), _tile_sprites, _door_sprites)
#                 # start_pos = x, y
#             elif level_map[y][x] == 'B':
#                 pass
#                 # engine_main.Tile(game_data.images['floor'], (x, y), _tile_sprites)
#                 # Door(game_data.images['door_closed'], (x, y), _tile_sprites, _close_door_sprites)
#             elif level_map[y][x] == '?':
#                 pass
#                 # engine_main.Tile(game_data.images['floor'], (x, y), _tile_sprites)
#                 # Key((x, y), _tile_sprites, _map_items_sprites, _key_sprites)
#             elif level_map[y][x] == '!':
#                 pass
#                 # engine_main.Tile(game_data.images['floor'], (x, y), _tile_sprites)
#                 # Enemy((x, y), _character_sprites, _enemy_sprites)
#             elif level_map[y][x] == 'R':
#                 pass
#                 # engine_main.Tile(game_data.images['floor'], (x, y), _tile_sprites)
#                 # MagicHit((x, y), _tile_sprites, _map_items_sprites, _magic_hit_sprites)
#             pass
