class_name Deck extends Resource

@export var name:String
@export var character:CharacterInfo = load("res://characters/character1/character1.tres")
@export var cards:Array[CardInfo]

func _init(_deck_code:String="") -> void:
	# do whatever to import the info from code
	pass

func to_code() -> String:
	# encode info into deck code
	return ""
