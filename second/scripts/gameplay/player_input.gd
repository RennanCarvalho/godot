extends CharacterInput
@export_category("Player input")
@export var holdThreshold : float = 0.1
@export var holdTime : float = 0.0

func _ready():
	Logger.info('Loading player input component ...', self)
