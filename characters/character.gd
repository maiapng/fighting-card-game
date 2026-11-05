class_name Character extends Node2D

var character:CharacterInfo
var deck:Deck
@onready var sprite:AnimatedSprite2D = $Sprite

func set_deck(deck_code:String) -> void:
	deck = Deck.new(deck_code)
	character = deck.character

func _ready() -> void:
	sprite.sprite_frames = character.animations
