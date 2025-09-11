extends Node2D
const SPEED= 60
var direction = 1

@onready var ray_cast_right: RayCast2D = $"ray-cast-right"
@onready var ray_cast_left: RayCast2D = $"ray-cast-left"
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += SPEED * delta * direction
