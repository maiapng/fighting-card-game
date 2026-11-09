extends Node

var lobby_id:int = 0
var invite_lobby_id:int = 0


func _ready() -> void:
	initialize_steam()

func initialize_steam() -> void:
	var initialize_response: Dictionary = Steam.steamInitEx()
	print("Did Steam initialize?: %s " % initialize_response)
