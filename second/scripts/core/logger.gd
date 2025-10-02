extends Node
class_name Logger

enum LogLevel { DEBUG, INFO, WARNING, ERROR, NONE }

static var level: LogLevel = LogLevel.NONE


static func _write(msg_level: LogLevel, level_name: String, msg: String, node: Node) -> void:
	if msg_level < level:
		return
	var datetime := Time.get_datetime_string_from_system(true, true)
	var log_message = "[%s] [%s] [%s] " % [datetime, level_name, node.name] + msg
	
	print(log_message)

static func debug(msg: String, node: Node) -> void: _write(LogLevel.DEBUG, "DEBUG", msg, node)
static func info(msg: String, node: Node) -> void: _write(LogLevel.INFO, "INFO", msg, node)
static func warning(msg: String, node: Node) -> void: _write(LogLevel.WARNING, "WARNING", msg, node)
static func error(msg: String, node: Node) -> void: _write(LogLevel.ERROR, "ERROR", msg, node)
