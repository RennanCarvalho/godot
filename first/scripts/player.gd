extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var canDoubleJump = true
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
 	# Gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Pulo
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			canDoubleJump = true
		elif canDoubleJump:
			velocity.y = JUMP_VELOCITY
			canDoubleJump = false

	# get the input direcion: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0: animated_sprite.flip_h = false
	elif direction < 0: animated_sprite.flip_h = true
	
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
