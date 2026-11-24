class_name Game extends Node2D

const CHARACTER_SCENE:PackedScene = preload("uid://gbhajhckw7as")
@onready var background:Sprite2D = $Background
@onready var stage:TileMapLayer = $Stage

var characters:Array[Character]
var player_deck:Deck

func _ready() -> void:
	print(player_deck)
	_add_character.rpc(multiplayer.get_unique_id(), player_deck)

@rpc("any_peer", "call_local")
func _add_character(id:int, deck:Deck) -> void:
	print("oi")
	var new_character:Character = Character.new()
	new_character.set_deck(deck)
	call_deferred("add_child", new_character)
	new_character.name = "character_%d" % id
	characters.append(new_character)
