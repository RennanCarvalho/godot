extends Area2D

signal damage(value : int)
@onready var slime: Node2D = $".."

func _on_body_entered(body: Node2D) -> void:
	slime.punch()
