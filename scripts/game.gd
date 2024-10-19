extends Node2D


func spawn_enemy():
	var new_enemy = preload("res://scenes/enemy_1.tscn").instantiate()
	%SpawnPoint.progress_ratio = randf()
	new_enemy.global_position = %SpawnPoint.global_position
	add_child(new_enemy)


func _on_timer_timeout() -> void:
	spawn_enemy()


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true	
