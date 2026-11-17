extends Node

const GAME:PackedScene = preload("uid://c8cuiba5i5mn6")

var lobby_id:int = 0
var invite_lobby_id:int = 0

func _ready() -> void:
	initialize_steam()

func initialize_steam() -> void:
	var initialize_response: Dictionary = Steam.steamInitEx()
	print("Did Steam initialize?: %s " % initialize_response)

func start_game(opponent_id:int) -> void:
	var game:Game = GAME.instantiate()
	game.opponent_id = opponent_id
	get_tree().change_scene_to_node(game) 
