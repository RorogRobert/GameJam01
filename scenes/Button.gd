extends Button

signal tapped

func _on_Button_pressed():
	emit_signal("tapped", self)
	print("emit_signal(tapped, self)")
