extends Control

const IP_ADDRESS:String = "localhost"
const PORT:int = 122
const game_scene:PackedScene = preload("uid://c8cuiba5i5mn6")

func _ready() -> void:
	multiplayer.peer_connected.connect(_on_peer_connected)

func _on_host_pressed() -> void:
	var peer:ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, 2)
	multiplayer.multiplayer_peer = peer

func _on_join_pressed() -> void:
	var peer:ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer

func _on_peer_connected(_id:int) -> void:
	get_tree().change_scene_to_packed(game_scene)
