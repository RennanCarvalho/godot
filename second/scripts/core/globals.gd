extends Node
class_name Globals

static var instance: Globals = null

@export var GRID_SIZE: int = 16
@export var LOG_LEVEL: int = 0  # 0=DEBUG, 1=INFO, 2=WARNING, 3=ERROR, 4=NONE


func _ready():
	instance = self
	Logger.level = LOG_LEVEL
	Logger.info("Loading globals", self)
