class_name CardInfo extends Resource 

enum BlockType { None, Low, High }

@export var id:String
@export var name:String
@export var description:String
@export var speed:int
@export var damage:int
@export var hitbox_range:Vector2i
@export var block_type:BlockType
@export var art:CompressedTexture2D
@export var effect:CardEffect
