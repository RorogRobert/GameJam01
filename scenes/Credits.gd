extends Control

var _sceneFader

func _ready():
	_sceneFader = find_node("Fader")

func _on_BtnBack_pressed():
	$PlayerBtnClick.play()
	Fader.fadeOut(_sceneFader, "res://scenes/Menu.tscn", 0.5)
