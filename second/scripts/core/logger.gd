extends Node
class_name Logger

static var level: Enums.LogLevel = Enums.LogLevel.NONE

static func _write(msg_level: Enums.LogLevel, level_name: String, msg: String, node: Node) -> void:
	if msg_level < level:
		return
	var datetime :String = Time.get_datetime_string_from_system(true, true)
	var log_message: String = "[%s] [%s] [%s] %s" % [datetime, level_name, node.name, msg]
	var color : String = "CYAN"
	match msg_level:
		Enums.LogLevel.DEBUG: color = "WHITE"
		Enums.LogLevel.INFO: color = "CYAN"
		Enums.LogLevel.WARNING: color = "YELLOW"
		Enums.LogLevel.ERROR: color = "MAROON"

	print_rich("[color=%s]%s[/color]" % [color, log_message])

static func debug(msg: String, node: Node) -> void: _write(Enums.LogLevel.DEBUG, "DEBUG", msg, node)
static func info(msg: String, node: Node) -> void: _write(Enums.LogLevel.INFO, "INFO", msg, node)
static func warning(msg: String, node: Node) -> void: _write(Enums.LogLevel.WARNING, "WARNING", msg, node)
static func error(msg: String, node: Node) -> void: _write(Enums.LogLevel.ERROR, "ERROR", msg, node)
