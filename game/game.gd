class_name Game extends Node2D

const CHARACTER_SCENE:PackedScene = preload("uid://gbhajhckw7as")
@onready var background:Sprite2D = $Background
@onready var stage:TileMapLayer = $Stage

var opponent_id:int
var host_character:Character
var client_character:Character

func starting_game(deck:Deck) -> Game:
	host_character = Character.new()
	host_character.set_deck(deck)
	call_deferred("add_child", host_character)
	return self
