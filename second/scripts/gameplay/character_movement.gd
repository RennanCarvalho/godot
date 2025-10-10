extends Node
class_name CharacterMovement
signal animationEventHandler()
@export_category("Nodes")
@export var character : Node2D
@export var characterInput : CharacterInput

@export_category("Movement")
@export var TargetPosition : Vector2 = Vector2.RIGHT
@export var isWalking : bool = false

func _ready():
	Logger.info("Loading player movement component ...", self)

func IsMoving() -> bool:
	return isWalking

func StartWalking():
	if not isWalking:
		# TODO: walk animation
		TargetPosition = character.position + characterInput.direction * Globals.instance.GRID_SIZE
		Logger.info("Moving from ${character.position} to ${TargetPosition}", self)
		isWalking = true
	else:
		# TODO: idle animation
		return

func Walk(delta: float):
	if isWalking:
		character.position = character.position.move_toward(TargetPosition, delta * globals.instance.GRID_SIZE)
		if character.position.distance_to(TargetPosition) < 1:
			StopWalking()
	else:
		#TODO: idle animation
		return
		
func StopWalking():
	isWalking = false
	SnapPositionToGrid()

func Turn():
	#TODO: turn animation
	return

func SnapPositionToGrid():
	var grid_size = globals.instance.GRID_SIZE
	character.position = Vector2(
		round(character.position.x / grid_size) * grid_size,
		round(character.position.y / grid_size) * grid_size)
