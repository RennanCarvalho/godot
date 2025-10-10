extends Node
class_name CharacterInput

signal walkEventHandler();
signal jumpEventHandler()

@export_category("Common input")
@export var direction : Vector2 = Vector2.ZERO
@export var targetPosition : Vector2 = Vector2.ZERO
