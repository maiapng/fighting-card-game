class_name Game extends Node2D

var left_character:Character
var right_character:Character

func _init(host_deck:Deck, client_deck:Deck) -> void:
	left_character = Character.new()
