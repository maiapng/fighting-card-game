class_name Character extends Node2D

var character:CharacterInfo
var deck:Array[CardInfo]
@onready var sprite:AnimatedSprite2D = $Sprite

func _init(deck_code:String) -> void:
	character = Utils.deck_code_to_character(deck_code)
	deck = Utils.deck_code_to_cards(deck_code)
	sprite.sprite_frames = character.animations
	# import relevant hitboxes based on cards?
