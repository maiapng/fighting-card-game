class_name Deck extends Resource

@export var name:String
@export var character:CharacterInfo = CardDatabase.Characters.character1
@export var cards:Array[CardInfo]

func _init(_deck_code:String="") -> void:
	# do whatever to import the info from code
	pass

func to_code() -> String:
	# encode info into deck code
	return ""
