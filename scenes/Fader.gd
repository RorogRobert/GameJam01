extends ColorRect

func fadeOut(var _sceneFader, var _scenePath, var _delay = 0.2):
	var _player = _sceneFader.get_node("AnimationPlayer")
	_player.play_backwards("FadeIn")
	yield(get_tree().create_timer(_delay), "timeout")
	assert(get_tree().change_scene(_scenePath) == OK)
	_player.play("FadeIn")
