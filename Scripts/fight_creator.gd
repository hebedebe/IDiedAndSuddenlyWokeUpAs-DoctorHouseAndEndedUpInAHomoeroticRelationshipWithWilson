extends Node

func create_fight(...enemies: Array) -> void:
	get_tree().change_scene_to_file("res://Scenes/battle.tscn")
	var battle_scene: Battle = get_tree().current_scene
	for enemy in enemies:
		var enemy_scene: Enemy = preload("res://Scenes/enemy.tscn").instantiate()
		enemy_scene.data = load(enemy).copy()
		battle_scene.enemies.add_child(enemy_scene)
