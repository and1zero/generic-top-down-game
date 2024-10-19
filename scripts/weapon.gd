extends Area2D


func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if !enemies_in_range.is_empty():
		for target_enemy in enemies_in_range:
			if target_enemy.health <= 0:
				continue
			look_at(target_enemy.global_position)


func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %Muzzle.global_position
	new_bullet.global_rotation = %Muzzle.global_rotation
	%Muzzle.add_child(new_bullet)


func _on_timer_timeout() -> void:
	shoot()
