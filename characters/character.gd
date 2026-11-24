class_name Character extends Node2D

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
	character = CardDatabase.get_character(character_deck.character)
	current_health = character.health
	deck = character_deck.cards
	deck.shuffle() 

func draw(amount:int) -> void:
	for i in amount:
		var card:CardInfo = deck.pop_front()
		hand.append(card)
		card_drawn.emit(card_drawn)
