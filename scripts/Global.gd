extends Node

var currentDificult
var isHelpPlayed = false

var colors = [
		{"idx": 0, "name": "Red", "color": Color(1.0, 0.0, 0.0)},
		{"idx": 1, "name": "Green", "color": Color(0, 1.0, 0.0)},
		{"idx": 2, "name": "Blue", "color": Color(0, 0, 1.0)}
		]

var dificulty = [
	{"steps": 90, "name": "HARD"},
	{"steps": 50, "name": "NORMAL"},
	{"steps": 10, "name": "EASY"}
	]

func getColor(var _colorIdx):
	return colors[_colorIdx]

func getDificulty(var _dificultIdx):
	return dificulty[_dificultIdx]
