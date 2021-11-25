extends Control

var _step
var _currentStepsLevel
var rng = RandomNumberGenerator.new()
var _sceneFader
onready var _transparentRectangle = $GridRectangle/Transparent
var button = preload("res://scenes/Button.tscn")
var _color

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.isHelpPlayed:
		$PopUpStart.visible = false
	else:
		Global.isHelpPlayed = true

	_sceneFader = find_node("Fader")
	var center = Vector2(200, 200)
	var radius = 80
	_step = 0

	#$Sprite.modulate = Color(0, 0, 1) # blue shade
	#$Sprite.position = Vector2(200,200)
	
	var _firstRectangle = $GridRectangle/Button
	print(Global.currentDificult)
	_currentStepsLevel = Global.getDificulty(Global.currentDificult).steps
	_color = Global.getColor(Global.currentDificult)
	
	$BtnTop/TitleWitch/LabelLevel.set_text("LEVEL: " +  Global.getDificulty(Global.currentDificult).name)
	$BtnTop/TitleWitch/Label.set_text("WHICH COLOR IS NOT " + _color.name + "?")
	$BtnTop/TitleWitch/LabelMaxSteps.set_text("MAX STEPS: " + str(_currentStepsLevel))
	$LabelCurrentStep.add_color_override("font_color", _color.color)
	$BtnBack/Label.add_color_override("font_color", _color.color)
	$BtnBack/Label2.add_color_override("font_color", _color.color)
	$LabelCurrentStep.set_text("CURRENT STEP " + str(_step) + "/" + str(_currentStepsLevel))
	
	for i in range(_currentStepsLevel):
		var _button = button.instance()
		_button.get_node("Label").set_text(str(i+1))
		_button.connect("tapped", self,  "buttonTapped")
		_button.get_node("Color").color = randomColor(_color.idx)
		$GridRectangle.add_child(_button)

func randomColor(var _key):
	var _random = rng.randf_range(1, 0.60)
	rng.randomize()

	match _key:
		0:
			return Color(_random, 0, 0)
		1:
			return Color(0, _random, 0)
		2:
			return Color(0, 0, _random)

func _on_BtnBack_pressed():
	$PlayerBtnClick.play()
	yield(get_tree().create_timer(0.2), "timeout")
	Fader.fadeOut(_sceneFader, "res://scenes/Menu.tscn", 0.2)

func buttonTapped(var _self):
	var _rnd = randonRange(1,4)

	match int(_rnd):
		1:
			$PlayerBtnYy.play()
		2:
			$PlayerBtnYye.play()
		3:
			$PlayerBtnYyee.play()
		4:
			$PlayerBtnMruu.play()
	
	var _duplicate = _transparentRectangle.duplicate()
	_self.replace_by(_duplicate)
	for child in _duplicate.get_children():
		child.queue_free()
	_duplicate.visible = true
	_step += 1
	$LabelCurrentStep.set_text("CURRENT STEP " + str(_step) + "/" + str(_currentStepsLevel))
	
	if _step == _currentStepsLevel:
		popUp(false)

func _on_BtnTop_pressed():
	popUp(true)

func popUp(var _isSuccess):
	if _isSuccess:
		$PopUp/Label.set_text("CONGRATULATION")
		$PopUp/AnimationPlayerPopUp.play("popup")
	else:
		$PopUp/Label.set_text("FAILURE")
		$PopUp/AnimationPlayerPopUp.play("popup")
	
	$PopUp/BlackIsNot.set_text("Black is not " + _color.name)

func randonRange(var _x, var _y):
	rng.randomize()
	print(_x, _y)
	if _x != 0:
		_x -= 1

	var _r = rng.randf_range(_x, _y)
	print(_r)
	return ceil(_r)

func _on_btnPopUpClose_pressed():
	$PopUp/AnimationPlayerPopUp.play_backwards("popup")
