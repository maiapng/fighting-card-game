@tool
class_name Card extends Control

@export_tool_button("Set Card")
var set_card_action:Callable = _refresh_info

@export var card:CardInfo:
	set(new_card):
		card = new_card
		art.texture = card.art
		title.text = card.title
		description.text = card.description
		block.text = "L" if card.block_type == CardInfo.BlockType.Low else ("H" if card.block_type == CardInfo.BlockType.High else "")

@export var art:TextureRect
@export var title:RichTextLabel
@export var description:RichTextLabel
@export var block:RichTextLabel

func _refresh_info() -> void:
	card = card
