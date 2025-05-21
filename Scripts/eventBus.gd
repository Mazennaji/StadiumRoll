extends Node

signal gameOver
signal levelPassed

var levels = ["res://Scenes/Level 1.tscn","res://Scenes/Level 2.tscn" , "res://Scenes/Level 3.tscn"]
var currentLevel = 0

func _ready() -> void:
	levelPassed.connect(nextLevel)

func nextLevel():
	if currentLevel != 2 :
		currentLevel +=1
		get_tree().change_scene_to_file.bind(levels[currentLevel]).call_deferred()
	else:
		print("Main Menu")
