extends Control

const lobby_scene:PackedScene = preload("uid://bvcbmhhaqmq1i")
const IP_ADDRESS:String = "localhost"
const PORT:int = 122


func _on_host_pressed() -> void:
	var peer:ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, 2)
	multiplayer.multiplayer_peer = peer
	get_tree().change_scene_to_packed(lobby_scene)

func _on_join_pressed() -> void:
	var peer:ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer
