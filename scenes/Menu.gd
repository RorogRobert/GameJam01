extends Control

onready var tree = get_tree()
onready var selectionEasy = $MarginContainer/CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selectionNormal = $MarginContainer/CenterContainer/VBoxContainer/CenterContainer2/HBoxContainer2/Selector
onready var selectionHard = $MarginContainer/CenterContainer/VBoxContainer/CenterContainer3/HBoxContainer3/Selector
onready var selectionCredits = $MarginContainer/CenterContainer/VBoxContainer/CenterContainer4/HBoxContainer4/Selector
onready var selectionExit = $MarginContainer/CenterContainer/VBoxContainer/CenterContainer5/HBoxContainer5/Selector
var _sceneFader
var _currentSelection = -1

func _ready():
	_sceneFader = find_node("Fader")
	clearSelectionMenu()

func handleSelection(_currentSelection):
	if (_currentSelection < 3):
		$PlayerBtnClick.play()
		Fader.fadeOut(_sceneFader, "res://scenes/Game.tscn", 0.5)
		Global.currentDificult = _currentSelection
		
	elif (_currentSelection == 4):
		$PlayerBtnGoodBye.play()
		yield(get_tree().create_timer(0.2), "timeout")
		tree.quit()

func clearSelectionMenu():
	selectionEasy.text = ""
	selectionNormal.text = ""
	selectionHard.text = ""
	selectionCredits.text = ""
	selectionExit.text = ""
	
func setCurrentSelection(_currentselection):
	clearSelectionMenu()

	if _currentSelection == 0:
		selectionEasy.text = ">"
	elif _currentSelection == 1:
		selectionNormal.text = ">"
	elif _currentSelection == 2:
		selectionHard.text = ">"
	elif _currentSelection == 3:
		selectionCredits.text = ">"
	elif _currentSelection == 4:
		selectionExit.text = ">"

func select(var _current):
	if _currentSelection != _current:
		$PlayerBtnChange.play()
		_currentSelection = _current
		setCurrentSelection(_currentSelection)

func _on_HBoxContainer_mouse_entered():
	select(0)

func _on_HBoxContainer2_mouse_entered():
	select(1)

func _on_HBoxContainer3_mouse_entered():
	select(2)

func _on_HBoxContainer4_mouse_entered():
	select(3)

func _on_HBoxContainer5_mouse_entered():
	select(4)

func _on_Easy_mouse_entered():
	select(0)

func _on_Normal_mouse_entered():
	select(1)

func _on_Hard_mouse_entered():
	select(2)

func _on_Credits_mouse_entered():
	select(3)

func _on_Exit_mouse_entered():
	select(4)

func _on_Easy_pressed():
	$PlayerBtnClick.play()
	yield(get_tree().create_timer(0.2), "timeout")
	Fader.fadeOut(_sceneFader, "res://scenes/Game.tscn", 0.2)
	Global.currentDificult = 0

func _on_Normal_pressed():
	$PlayerBtnClick.play()
	yield(get_tree().create_timer(0.2), "timeout")
	Fader.fadeOut(_sceneFader, "res://scenes/Game.tscn", 0.2)
	Global.currentDificult = 1

func _on_Hard_pressed():
	$PlayerBtnClick.play()
	yield(get_tree().create_timer(0.2), "timeout")
	Fader.fadeOut(_sceneFader, "res://scenes/Game.tscn", 0.2)
	Global.currentDificult = 2

func _on_Credits_pressed():
	$PlayerBtnClick.play()
	yield(get_tree().create_timer(0.2), "timeout")
	Fader.fadeOut(_sceneFader, "res://scenes/Credits.tscn", 0.2)

func _on_Exit_pressed():
	$PlayerBtnGoodBye.play()
	yield(get_tree().create_timer(1), "timeout")
	tree.quit()
