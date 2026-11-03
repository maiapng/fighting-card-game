extends Control

const IP_ADDRESS:String = "localhost"
const PORT:int = 122
const 

func _ready() -> void:
	multiplayer.connected_to_server.connect(_on_connected_to_server)

func _on_host_pressed() -> void:
	var peer:ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, 2)
	multiplayer.multiplayer_peer = peer

func _on_join_pressed() -> void:
	var peer:ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer

func _on_connected_to_server() -> void:
	scene
