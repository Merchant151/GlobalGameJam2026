extends Control
@onready var menu_panel: Panel = $PanelContainer/MenuPanel
@onready var credits_panel: Panel = $PanelContainer/CreditsPanel

# Called when the node enters the scene tree for the first time.
func _ready(): #Similiar to start in unity or beginplay in unreal
	menu_panel.visible = true
	credits_panel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_btn_pressed():
	print("Start")
	get_tree().change_scene_to_file("res://game.tscn")


func _on_credits_btn_pressed():
	print("credits pressed")
	menu_panel.visible = false
	credits_panel.visible = true


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_back_btn_pressed():
	menu_panel.visible = true
	credits_panel.visible = false
