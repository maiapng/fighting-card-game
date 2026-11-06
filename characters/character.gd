class_name Character extends Node2D

var character:CharacterInfo
var deck:Deck
var current_health:int:
	set(new_health):
		current_health = new_health
		health_updated.emit(current_health)

@onready var sprite:AnimatedSprite2D = $Sprite

signal health_updated(health:int)

func set_deck(deck_code:String) -> void:
	deck = Deck.new(deck_code)
	character = deck.character
	current_health = character.health

func _ready() -> void:
	sprite.sprite_frames = character.animations
