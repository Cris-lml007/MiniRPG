extends Area2D

export(PackedScene) var new_scene

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() >0:
			next_level()
			
func next_level():
	var PTS = get_tree().change_scene_to(new_scene)
