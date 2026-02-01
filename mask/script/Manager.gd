extends Node2D

#
var running = true
var suspect_value = 20
#
var mask_selection = false
var questioning = false
var active_guy = false
var car = 0
var health_object = null
var visit_count = 0
var used_list = []
var mask1 = null
var mask2 = null
var mask3 = null
var mask4 = null

var mask_trey = null
var popup_win = null
var popup_lose= null

var selected = 0

@onready var characterArray = [ 
$dialog_prototype/resources.character_tag_MELODY, 
$dialog_prototype/resources.character_tag_CLARRISA,
$dialog_prototype/resources.character_tag_DELI,
$dialog_prototype/resources.character_tag_JARED,
$dialog_prototype/resources.character_tag_TYLER,
$dialog_prototype/resources.character_tag_WALTER,
$dialog_prototype/resources.character_tag_VICA,
]
#var character_paths= { $dialog_prototype/resources.character_tag_SOLDIER: {
#	big_brother_variant:1,
#	}
#}
var answer_key = [
	#to modify the answer for rebel is correct change the first value in the sub-list
	[1,2], # Melody 
	[1,2], # Clarrisa
	[1,2], # DELI
	[1,2], # Jarhead
	[1,2], # Tyler
	[1,2], # walter
	[1,2]  # vica
	] 
var answer = null

signal mask(maskNum)
signal score_signal(update_by)
signal message_singal(message)
@export var score_path : NodePath 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('Hello World')
	var score_node = get_node(score_path)
	score_signal.connect(score_node.update_score)
	message_singal.connect(score_node.update_message)
	var dial = $dialog_prototype
	dial.starting_dialog_ended.connect(on_starting_dialog_ended)
	dial.ending_dialog_ended.connect(on_ending_dialog_ended)
	#mask.connect(dial.mask_choice)
	## Start game. 
	#start UI 
	##
	#var UI = load('res://addons/UI/Scene/interface.tscn')
	#UI = UI.instantiate()
	#add_child.call_deferred(UI)
	health_object = get_node("Interface/Base Bar/MoralEnergyBar")
	mask1 = get_node("Interface/Mask selection panel/HBoxContainer/rebelbtn")
	mask2 = get_node("Interface/Mask selection panel/HBoxContainer/obeybtn")
	mask3 = get_node("Interface/Mask selection panel/HBoxContainer/rebelbtn3")
	mask4 = get_node("Interface/Mask selection panel/HBoxContainer/rebelbtn4")
	
	mask_trey = get_node("Interface/Mask selection panel")
	popup_lose = get_node("Interface/Lose Panel")
	popup_win = get_node("Interface/Win Panel")
	popup_lose.visible = false
	popup_win.visible = false
	#set_suspect()
	spawn_NPC()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#every frame check user in  
	if(Input.is_action_just_pressed("esc")):
		print('pause the game!')
	if((Input.is_action_just_pressed("mask1")||selected == 1)&&mask_selection):
		print('mask1 selected')
		print('sent the rebel mask')
		$dialog_prototype.set_mask_choice('2')
		$dialog_prototype.end_encounter()
		answer = 1 
		selected = 0
		hide_masks()
		##kill_npc()
	if((Input.is_action_just_pressed('mask2')|| selected == 2)&&mask_selection):
		print('mask2 selected')
		print('sent the big brother mask')
		#mask.emit('2')
		$dialog_prototype.set_mask_choice('1')
		$dialog_prototype.end_encounter()
		answer = 2
		selected = 0
		hide_masks()
		##kill_npc()
	if((Input.is_action_just_pressed('mask3')|| selected == 3)&&mask_selection):
		print('mask3 selected')
		print('sent the second rebel mask')
		#mask.emit('2')
		$dialog_prototype.set_mask_choice('2')
		$dialog_prototype.end_encounter()
		answer = 3
		selected = 0
		hide_masks()
	if((Input.is_action_just_pressed('mask4')|| selected == 2)&&mask_selection):
		print('mask selected')
		print('sent the rebel mask')
		$dialog_prototype.set_mask_choice('2')
		$dialog_prototype.end_encounter()
		answer = 4
		selected = 0
		hide_masks()
	
	if(!active_guy&&running):
		await get_tree().create_timer(2.0).timeout
		if(!active_guy): spawn_NPC()

func spawn_NPC():
	hide_masks()
	print('spawn an NPC')
	visit_count += 1
	active_guy = true
	var picked_new = false
	while(!picked_new):
		car = randi()%len(characterArray)
		if (used_list.has(car)):
			continue
		else: 
			used_list.append(car)
			picked_new = true
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
	if(health_object):
		var cur = health_object.value
		health_object.value = cur + num
	pass

func on_starting_dialog_ended(): 
	mask_selection = true
	print('mask_selection True')
	show_masks()

func on_ending_dialog_ended():
	active_guy = false
	mask_selection= false
	#Doo all of the game updates. 
	#change Score
	var res = check_answer()
	check_game_result(res)
	

func check_game_result(was_good):
	var result = health_object.value
	#if (was_good):
	#	print('good thing happens')
	#else:
	#	print('bad thing happnes')
	if (result <= 0):
		message_singal.emit("GAME OVER")
		running = false
		popup_lose.visible = true
	elif(result >= 100):
		message_singal.emit("YOU WIN")
		running = false
		popup_win.visible = false
	elif(len(used_list) == len(characterArray)):
		print("ran out of characters for today!")
		running = false
		message_singal.emit('no one else visits the shop today!')
	else:
		print("game continues") 
		
	

func check_answer():
	if(answer_key[car][int($dialog_prototype.varient)] == 1):
		#this is someone who prefers a rebel mask
		pass
		if(answer == 2 ):
			#give them the big brother mask
			#change_suspect(-20)
			change_score(-20)
			return false
		elif(answer == answer_key[car][int($dialog_prototype.varient)]):
			#give the rebel the exact mask they want
			print('answer',answer)
			print('exact fit!')
			change_score(+30)
			#change_suspect(+5)
			return true
		else: 
			print('answer')
			print('almost Match')
			#change_suspect(+10)
			change_score(10)
			return true
	elif(answer_key[car][int($dialog_prototype.varient)] == 2):
		#this is someone who prefers a Big brother mask. 
		if (answer == 2):
			#gave a big brother mask to a big brother supporter
			#moral drops but so does suspission
			change_score(-10)
			#change_suspect(-20)
			return true
			
		else:
			#give big brother any rebel mask
			change_score(-20)
			#change_suspect(30)
			return false
			

	#if (answer_key[car][int($dialog_prototype.varient)] == answer):
		#print('correct player match')
		#if (answer == 1):
			##gave a rebel mask to an aspiring rebel
			#change_score(30)
		#if (answer == 2):
			##strengthened Big Brothers hold But reduces supsisions
			#change_score(-10)
		#return true
	#else:
		#print('gave player the wrong mask')
		#if (answer == 1):
			##Gave a snitch a rebel mask
			#change_score(-30)
			#pass
		#elif (answer == 2):
			##turned away a lost soul Weekening the rebellion
			##decrease suspission
			#change_score(-20)
		#return false

func hide_masks():
	print("hide_masks")
	if(mask_trey):
		mask_trey.visible = false
	if(mask1):
		mask1.visible = false
		$"Interface/Mask selection panel/HBoxContainer/rebelbtn".disabled = true
	if(mask2):
		mask2.visible = false
		$"Interface/Mask selection panel/HBoxContainer/obeybtn".disabled = true
	if(mask3):
		mask3.visible = false
		$"Interface/Mask selection panel/HBoxContainer/rebelbtn3".disabled = true
	if(mask4):
		mask4.visible = false
		$"Interface/Mask selection panel/HBoxContainer/rebelbtn4".disabled = true

func show_masks():
	if(mask_trey):
		mask_trey.visible = true
	if(mask1):
		mask1.visible = true
		$"Interface/Mask selection panel/HBoxContainer/rebelbtn".disabled = false
	if(mask2):
		mask2.visible = true
		$"Interface/Mask selection panel/HBoxContainer/obeybtn".disabled = false
	if(mask3):
		mask3.visible = true
		$"Interface/Mask selection panel/HBoxContainer/rebelbtn3".disabled = false
	if(mask4):
		mask4.visible = true
		$"Interface/Mask selection panel/HBoxContainer/rebelbtn4".disabled = false

func mask1_selected():
	selected = 1
	
func mask3_selected():
	selected = 3

func mask4_selected():
	selected = 4

func mask2_selected():
	selected = 2

func change_suspect(num):
	suspect_value = suspect_value + num
	set_suspect()

func set_suspect():
	print('set the suspicion meter value')
	pass

func _on_button_pressed() -> void:
	pass # Replace with function body.
