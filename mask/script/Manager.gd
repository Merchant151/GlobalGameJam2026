extends Node2D

#
var mask_selection = false
var questioning = false
var active_guy = false
var car = 0

@onready var characterArray = [ $dialog_prototype/resources.character_tag_SOLDIER, $dialog_prototype/resources.character_tag_BALD_MAN]
#var character_paths= { $dialog_prototype/resources.character_tag_SOLDIER: {
#	big_brother_variant:1,
#	}
#}
var answer_key = [1 , 2] 
var answer = null

signal mask(maskNum)
signal score_signal(update_by)
@export var score_path : NodePath 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('Hello World')
	var score_node = get_node(score_path)
	score_signal.connect(score_node.update_score)
	var dial = $dialog_prototype
	#mask.connect(dial.mask_choice)
	## Start game. 
	#start UI 
	#Start anyTImers and such
	spawn_NPC()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#every frame check user in  
	if(Input.is_action_just_pressed("esc")):
		print('pause the game!')
	if(Input.is_action_just_pressed("mask1")&&mask_selection):
		print('mask1 selected')
		print('sent the bad mask')
		mask.emit('1')
		answer =1 
		##kill_npc()
		#await get_tree().create_timer(1.0).timeout
		#change_score(10)
	if(Input.is_action_just_pressed('mask2')&&mask_selection):
		print('mask2 selected')
		print('sent the good mask')
		mask.emit('2')
		answer = 2
		##kill_npc()
		await get_tree().create_timer(1.0).timeout
		change_score(-10)
	
	if(!active_guy):
		await get_tree().create_timer(2.0).timeout
		if(!active_guy): spawn_NPC()

func spawn_NPC():
	print('spawn an NPC')
	#TODO: change soldier tab to this guy
	active_guy = true
	car = randi()%len(characterArray)
	$dialog_prototype.set_active_character(characterArray[car])
	$dialog_prototype.start_new_encounter()
	##Yield for Gameply system
	#Read the input
	#set the choice and then allow that scenario to play out
	#Player feedback: bars going up Score+-
	#set enw active chracetr(kee track of played through characters)
	#Play Scenario Repeat
	#var npc = load("res://node_src/npc_node2d.tscn")
	##var npc = load("res://icon.tscn")
	#npc = npc.instantiate()
	
	#get_tree().current_scene.add_child.call_deferred(npc)
	pass

func kill_npc():
	if(active_guy):
		print('kill the guy')
		get_tree().current_scene.remove_child(active_guy)
		active_guy = null
	else:
		print('there is no guy')


func change_score(num):
	print('change score by ', num)
	score_signal.emit(num)
	pass

func on_starting_dialog_ended(): 
	mask_selection = true

func on_ending_dialog_ended():
	active_guy = false
	#Doo all of the game updates. 
	#change Score
	var res = check_answer()
	check_game_result(res)
	

func check_game_result(was_good):
	if (was_good):
		print('good thing happens')
	else:
		print('bad thing happnes')

func check_answer():
	if (answer_key[car] == answer):
		print('good')
		change_score(50)
		return true
	else:
		print('bad')
		change_score(-50)
		return false
