extends Node2D
@onready var sprite: AnimatedSprite2D = $sprite

func _ready() -> void:
	sprite.visible = false
