extends Area2D
@onready var timer: Timer = $Timer

signal damage(value : int)
@onready var slime: Node2D = $".."

func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	Engine.time_scale = 0.5
	slime.punch()
	timer.start()
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
