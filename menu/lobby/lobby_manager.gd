class_name LobbyManager extends Control

const LOBBY:PackedScene = preload("uid://nwkf1vr3lkvw")
@onready var _lobby_id_input:LineEdit = $ID

func _ready() -> void:
	Steam.lobby_created.connect(_on_lobby_created)
	Steam.lobby_joined.connect(_on_lobby_joined)
	if Steamworks.invite_lobby_id > 0:
		Steam.joinLobby(Steamworks.invite_lobby_id)
		Steamworks.invite_lobby_id = 0

func _on_lobby_created(connect_status:Steam.Result, lobby_id:int) -> void:
	if connect_status != Steam.Result.RESULT_OK:
		printerr("Failed to create a lobby: %s" % connect_status)
		return
	print("Successfully created lobby %s" % lobby_id)
	Steamworks.lobby_id = lobby_id
	if not Steam.setLobbyData(Steamworks.lobby_id, "lobby_name", "Test Lobby"):
		printerr("Failed to set lobby name")

func _on_lobby_joined(lobby_id:int, _permissions:int, _locked:int, response:Steam.ChatRoomEnterResponse) -> void:
	if response != Steam.ChatRoomEnterResponse.CHAT_ROOM_ENTER_RESPONSE_SUCCESS:
		printerr("Failed joining lobby %s" % response)
		return
	print("Lobby %s joined successfully" % lobby_id)
	Steamworks.lobby_id = lobby_id
	get_tree().change_scene_to_packed(LOBBY)

func _on_host_pressed() -> void:
	Steam.createLobby(Steam.LobbyType.LOBBY_TYPE_PRIVATE, 2)

func _on_join_pressed() -> void:
	Steam.joinLobby(int(_lobby_id_input.text))
