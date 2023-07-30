extends Area2D

#export(PackedScene)
#var new_scene

func _input(event):
	if event.is_action_pressed("ui_accept"):
		next_level(get_meta("miniGame"))
			
func next_level(scene):
	get_tree().change_scene_to_file(scene)
