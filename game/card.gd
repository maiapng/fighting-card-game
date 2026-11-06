@tool
class_name Card extends Control

@export_tool_button("Set Card")
var set_card_action:Callable = _refresh_info

@export var card:CardInfo:
	set(new_card):
		card = new_card
		title.text = card.name
		description.text = card.description

@export var title:Label
@export var description: RichTextLabel

func _refresh_info() -> void:
	card = card
