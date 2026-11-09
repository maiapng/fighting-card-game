class_name Game extends Node2D

const CHARACTER_SCENE:PackedScene = preload("uid://gbhajhckw7as")
@onready var background:Sprite2D = $Background
@onready var stage:TileMapLayer = $Stage
var host_character:Character
var client_character:Character
var rng:RandomNumberGenerator = RandomNumberGenerator.new()

func starting_game() -> Game:
	return self

func _ready() -> void:
	if multiplayer.is_server():
		_set_seed.rpc(randi())

@rpc("call_local")
func _set_seed(game_seed:int) -> void:
	rng.seed = game_seed
