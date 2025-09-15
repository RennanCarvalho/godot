extends Area2D

@onready var slime: Node2D = $".."

func _on_body_entered(_body: Node2D) -> void:
	slime.punch()
