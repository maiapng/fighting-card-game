class_name Character extends Node2D

@onready var sprite:AnimatedSprite2D = $Sprite

signal health_updated(health:int)
signal card_drawn(card:CardInfo)

var character:CharacterInfo
var current_health:int:
	set(new_health):
		current_health = new_health
		health_updated.emit(current_health)
var deck:Array[CardInfo]
var hand:Array[CardInfo]

func set_deck(character_deck:Deck) -> void:
	# character = deck.character
	deck = character_deck.cards
	deck.shuffle() 
	current_health = character.health

func draw(amount:int) -> void:
	for i in amount:
		var card:CardInfo = deck.pop_front()
		hand.append(card)
		card_drawn.emit(card_drawn)
	
func _ready() -> void:
	sprite.sprite_frames = character.animations
