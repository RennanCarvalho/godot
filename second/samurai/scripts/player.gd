class_name Player
extends CharacterBody2D

@onready var state_machine: Node = $state_machine
@onready var animations: AnimatedSprite2D = $animations

func _ready() -> void:
	state_machine.init(self)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
