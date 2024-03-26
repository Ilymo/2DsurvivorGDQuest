extends Node2D


func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	



func _on_spawn_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.show()
	%Player.paused = true
	get_tree().call_group("mobs", "queue_free")
	await get_tree().create_timer(1).timeout
	%StartButton.show()


	
func _on_start_button_pressed():
	%GameOver.hide()
	get_tree().paused = false
	get_tree().call_group("mobs", "queue_free")
	
