class_name LobbyPlayer extends Control

@onready var _avatar:TextureRect = %Avatar
@onready var _username:Label = %Username
var steam_id:int = 0:
	set = _set_steam_id

func _set_steam_id(new_id:int) -> void:
	steam_id = new_id
	if not is_node_ready():
		await ready
	_avatar.steam_id = steam_id
	_username.steam_id = steam_id
