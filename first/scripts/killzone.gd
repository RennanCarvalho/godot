extends Area2D

@onready var slime: Node2D = $".."

func _on_body_entered(_body: Node2D) -> void:
	if get_parent().is_in_group("enemies"): slime.punch()
	else: get_tree().reload_current_scene()
