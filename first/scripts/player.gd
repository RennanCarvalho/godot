extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var canDoubleJump = true
var healthPoints = 100
func is_dead() -> bool:
	return healthPoints <= 0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
 	# Gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_dead():
		return  # não processa movimento nem animações

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

func _on_slime_2_do_damage(damage: int) -> void:
	if is_dead():
		animated_sprite.play("death")
		healthPoints = 100
		get_tree().reload_current_scene()
	healthPoints -= damage
	print("health points: ", healthPoints, " damage: ", damage)
