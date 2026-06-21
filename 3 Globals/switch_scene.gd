extends Node

func switch_scene(scene_path: String) -> void:
	get_tree().call_deferred("change_scene_to_file", scene_path)
