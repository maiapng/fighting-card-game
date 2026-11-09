class_name Lobby extends Control

const lobby_manager:PackedScene = preload("uid://doh8y12nbg4ky")
const lobby_player:PackedScene = preload("uid://jq7nioyf7t11")

func _ready() -> void:
	if Steamworks.lobby_id == 0:
		printerr("You are not in a lobby currently")
		return
