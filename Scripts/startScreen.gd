extends Control

func _ready():
	$controls/startBtn.grab_focus() #mantem em foco o botao start

#func _on_startBtn_pressed() -> void :
	#get_tree().change_scene() #caminho para cena level1

func _on_controlsBtn_pressed() -> void:
	var controlScreen = load("res://Scenes/ControlsScreen.tscn").instance()
	get_tree().current_scene.add_child(controlScreen) #caminho para informacao controle de jogo

func _on_quitbtn_pressed() -> void:
	get_tree().quit() #fecha o game
