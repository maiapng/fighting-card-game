class_name Lobby extends Control

const LOBBY_MANAGER:PackedScene = preload("uid://doh8y12nbg4ky")
const LOBBY_PLAYER:PackedScene = preload("uid://jq7nioyf7t11")

@onready var _title:Label = %Title
@onready var _table_list:VBoxContainer = %Tables
@onready var _player_list:VBoxContainer = %Players

func _ready() -> void:
	if Steamworks.lobby_id == 0:
		printerr("You are not in a lobby currently")
		get_tree().change_scene_to_packed(LOBBY_MANAGER)
		return
	_get_lobby_name()
	_get_lobby_members()

func _get_lobby_name() -> void:
	var lobby_name:String = Steam.getLobbyData(Steamworks.lobby_id, "lobby_name")
	_title.text = lobby_name

func _get_lobby_members() -> void:
	for player:Node in _player_list.get_children():
		player.visible = false
		player.queue_free()
	var num_lobby_members:int = Steam.getNumLobbyMembers(Steamworks.lobby_id)
	for i in range(0, num_lobby_members):
		var player_object:LobbyPlayer = LOBBY_PLAYER.instantiate()
		player_object.steam_id = Steam.getLobbyMemberByIndex(Steamworks.lobby_id, i)
		_player_list.call_deferred("add_child", player_object)
