class_name Game extends Node2D

@onready var background:Sprite2D = $Background
@onready var stage:TileMapLayer = $Stage
var host_character:Character
var client_character:Character
var rng:RandomNumberGenerator = RandomNumberGenerator.new()

func _init(host_deck:String="", client_deck:String="", random_seed:int=0) -> void:
	host_character = Character.new(host_deck)
	client_character = Character.new(client_deck)
	rng.seed = random_seed
