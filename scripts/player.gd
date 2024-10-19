extends CharacterBody2D
class_name Player

signal health_depleted

var health = 100
const DAMAGE_RATE = 5
const SPEED = 1200

@onready var animation := %Animation

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	# face left or right depending on the direction
	if velocity.x < 0:
		animation.flip_h = true
	elif velocity.x > 0:
		animation.flip_h = false

	if velocity.is_zero_approx():
		animation.play("idle")
	else:
		animation.play("walk")

	# check if enemies hurt player
	var overlapping_enemies = %HurtBox.get_overlapping_bodies()
	if !overlapping_enemies.is_empty():
		health -= DAMAGE_RATE * overlapping_enemies.size() * delta
		%HealthBar.value = health
		if health <= 0:
			health_depleted.emit()
