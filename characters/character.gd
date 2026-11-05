class_name Character extends Node2D

var character:CharacterInfo
var deck:Deck
@onready var sprite:AnimatedSprite2D = $Sprite

func _init(deck_code:String) -> void:
	deck = Deck.new(deck_code)
	character = deck.character
	sprite.sprite_frames = character.animations
	# import relevant hitboxes based on cards?
