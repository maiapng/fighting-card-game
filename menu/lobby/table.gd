class_name Table extends Control

@onready var _player1_avatar:TextureRect = $Panel/MarginContainer/HBoxContainer/Player1/SteamAvatarRect
@onready var _player1_username:Label = $Panel/MarginContainer/HBoxContainer/Player1/SteamUsername
@onready var _player2_avatar:TextureRect = $Panel/MarginContainer/HBoxContainer/Player2/SteamAvatarRect
@onready var _player2_username:Label = $Panel/MarginContainer/HBoxContainer/Player2/SteamUsername

var player1_steam_id:int = 0:
	set = _set_player1_steam_id

func _set_player1_steam_id(new_id:int) -> void:
	player1_steam_id = new_id
	if not is_node_ready():
		await ready
	_player1_avatar.steam_id = player1_steam_id
	_player1_username.steam_id = player1_steam_id

var player2_steam_id:int = 0:
	set = _set_player2_steam_id

func _set_player2_steam_id(new_id:int) -> void:
	player2_steam_id = new_id
	if not is_node_ready():
		await ready
	_player2_avatar.steam_id = player2_steam_id
	_player2_username.steam_id = player2_steam_id

# HACK FIX THIS WITH PROPER ENTER AND LEAVE TABLE FUNCTIONS
