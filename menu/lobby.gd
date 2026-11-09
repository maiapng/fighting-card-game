class_name Lobby extends Control

const game_scene:PackedScene = preload("uid://c8cuiba5i5mn6")

func _ready() -> void:
	multiplayer.peer_connected.connect()

func _on_peer_connected(id:int) -> void:
	
