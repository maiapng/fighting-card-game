class_name Lobby extends Control

const LOBBY_MANAGER:PackedScene = preload("uid://doh8y12nbg4ky")
const LOBBY_PLAYER:PackedScene = preload("uid://jq7nioyf7t11")
const GAME:PackedScene = preload("uid://c8cuiba5i5mn6")

@onready var _title:Label = %Title
@onready var _player_list:VBoxContainer = %Players
@onready var _deck_selector:OptionButton = %DeckSelector

func _ready() -> void:
	if Steamworks.lobby_id == 0:
		printerr("You are not in a lobby currently")
		get_tree().change_scene_to_packed(LOBBY_MANAGER)
		return
	_get_lobby_name()
	_get_lobby_members.rpc()
	_get_decks()

func _get_lobby_name() -> void:
	var lobby_name:String = Steam.getLobbyData(Steamworks.lobby_id, "lobby_name")
	_title.text = lobby_name

@rpc("any_peer", "call_local")
func _get_lobby_members() -> void:
	for player:Node in _player_list.get_children():
		player.visible = false
		player.queue_free()
	var num_lobby_members:int = Steam.getNumLobbyMembers(Steamworks.lobby_id)
	for i in range(0, num_lobby_members):
		var player_object:LobbyPlayer = LOBBY_PLAYER.instantiate()
		player_object.steam_id = Steam.getLobbyMemberByIndex(Steamworks.lobby_id, i)
		player_object.challenge_sent.connect(_on_challenge_sent)
		_player_list.call_deferred("add_child", player_object)

func _on_lobby_chat_update(lobby_id: int, _changed_id: int, _making_change_id: int, _chat_state: int) -> void:
	if Steamworks.lobby_id != lobby_id: return
	_get_lobby_members()

func _on_lobby_data_update(_success: int, lobby_id: int, _member_id: int) -> void:
	if Steamworks.lobby_id != lobby_id: return
	_get_lobby_members()

func _get_decks() -> void:
	for deck:Deck in UserData.decks:
		_deck_selector.add_item(deck.name)

func _on_challenge_sent(challengee_id:int) -> void:
	var id:int = multiplayer.get_multiplayer_peer().get_peer_id_for_steam_id(challengee_id)
	_on_challenge_received.rpc_id(id, multiplayer.get_unique_id())
	_start_game(id)
	
@rpc("any_peer")
func _on_challenge_received(challenger_id:int) -> void:
	print("oi")
	_start_game(challenger_id)

func _start_game(opponent_id:int) -> void:
	var game:Game = GAME.instantiate()
	game.opponent_id = opponent_id
	get_tree().change_scene_to_node(game) 
