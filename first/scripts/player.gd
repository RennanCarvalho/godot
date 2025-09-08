extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var canDoubleJump = false

func _physics_process(delta: float) -> void:
 	# Gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Pulo
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			canDoubleJump = true  # reseta double jump ao tocar o chão
		elif canDoubleJump:
			velocity.y = JUMP_VELOCITY
			canDoubleJump = false  # usa o double jump

	# Movimento horizontal
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
