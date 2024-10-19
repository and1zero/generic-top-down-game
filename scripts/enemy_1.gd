extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")
@onready var animation = %Animation

# this can be half of player's
const SPEED = 500


func _ready() -> void:
	animation.play("walk")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()


func take_damage():
	if health > 0:
		health -= 1
		animation.play("hit")
		await animation.animation_finished
	if health <= 0:
		animation.play("dead")
		await animation.animation_finished
		queue_free()
