class_name Character extends Node2D

var character:CharacterInfo
var deck:Deck
@onready var sprite:AnimatedSprite2D = $Sprite

func _init(_deck:Deck) -> void:
	deck = _deck
	character = deck.character
	sprite.sprite_frames = character.animations
	# import relevant hitboxes based on cards?
