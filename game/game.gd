class_name Game extends Node2D

const character_scene:PackedScene = preload("uid://gbhajhckw7as")
@onready var background:Sprite2D = $Background
@onready var stage:TileMapLayer = $Stage
var host_character:Character
var client_character:Character
var rng:RandomNumberGenerator = RandomNumberGenerator.new()

func starting_game(_id:int, host_deck:String="", client_deck:String="") -> Game:
	host_character = character_scene.instantiate()
	host_character.set_deck(host_deck)
	add_child(host_character)
	client_character = character_scene.instantiate()
	client_character.set_deck(client_deck)
	add_child(client_character)
	return self

func _ready() -> void:
	if multiplayer.is_server():
		_set_seed.rpc(randi())

@rpc("call_local")
func _set_seed(game_seed:int) -> void:
	rng.seed = game_seed
