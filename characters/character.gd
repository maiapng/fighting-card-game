class_name Character extends Node2D

var character:CharacterInfo
@onready var sprite:AnimatedSprite2D = $Sprite

func _init(new_info:CharacterInfo, deck) -> void:
	character = new_info
	sprite.sprite_frames = character.animations
