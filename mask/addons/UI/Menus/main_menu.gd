extends Control

@onready var main_buttons: VBoxContainer = $PanelContainer/MainButtons
@onready var credits_panel: Panel = $Credits Panel
# Called when the node enters the scene tree for the first time.
func _ready(): #Similiar to start in unity or beginplay in unreal
	main_buttons.visible = true
	credits_panel.visible = false

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
	

func _on_credit_pressed():
	main_buttons.visible = false
	credits_panel.visible = true


func _on_exit_pressed():
	get_tree().quit()
