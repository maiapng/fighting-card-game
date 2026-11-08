class_name Game extends Node2D

const character_scene:PackedScene = preload("uid://gbhajhckw7as")
@onready var background:Sprite2D = $Background
@onready var stage:TileMapLayer = $Stage
var host_character:Character
var client_character:Character
var rng:RandomNumberGenerator = RandomNumberGenerator.new()

func starting_game(id:int, host_deck:String="", client_deck:String="", random_seed:int=0) -> Game:
	host_character = character_scene.instantiate()
	host_character.set_deck(host_deck)
	add_child(host_character)
	client_character = character_scene.instantiate()
	client_character.set_deck(host_deck)
	add_child(client_character)
	rng.seed = random_seed
	return self
