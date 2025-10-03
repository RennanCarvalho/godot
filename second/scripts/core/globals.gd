extends Node
class_name Globals

static var instance: Globals = null

@export var GRID_SIZE: int = 16
@export var LOG_LEVEL: Enums.LogLevel = Enums.LogLevel.NONE

func _ready():
	instance = self
	Logger.level = LOG_LEVEL
	Logger.error("Loading globals ...", self)
