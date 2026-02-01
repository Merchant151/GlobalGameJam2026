extends Control
@onready var menu_panel: Panel = $PanelContainer/MenuPanel
@onready var credits_panel: Panel = $PanelContainer/CreditsPanel
@onready var sfx_slct_start = $"PanelContainer/MenuPanel/MainButtons/Start Btn/SFX_slct_start"
@onready var sfx_slct_credits = $"PanelContainer/MenuPanel/MainButtons/Credits Btn/SFX_slct_credits"
@onready var sfx_slct_quit = $"PanelContainer/MenuPanel/MainButtons/Quit Btn/SFX_slct_quit"
@onready var sfx_slct_back = $"PanelContainer/CreditsPanel/Back Btn/SFX_slct_back"

# Called when the node enters the scene tree for the first time.
func _ready(): #Similiar to start in unity or beginplay in unreal
	menu_panel.visible = true
	credits_panel.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_exit_pressed():
	sfx_slct_quit.play()
	get_tree().quit()

func _on_start_btn_pressed():
	sfx_slct_start.play()
	FadeToBlack.transition()
	await FadeToBlack.on_transition_finshied
	get_tree().change_scene_to_file("res://game.tscn")

func _on_credits_btn_pressed():
	sfx_slct_credits.play
	menu_panel.visible = false
	credits_panel.visible = true
	
func _on_back_btn_pressed():
	sfx_slct_back.play()
	menu_panel.visible = true
	credits_panel.visible = false
