class_name CardDatabase extends Node

enum Characters {
	Character1,
	Character2,
}

static func get_character(char:Characters) -> CharacterInfo:
	match(char):
		Characters.Character1:
			return preload("uid://db18x5heoqrh")
	return
