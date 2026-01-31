extends Node2D

#
var active_guy = null
signal score_signal(update_by)
@export var score_path : NodePath 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('Hello World')
	var score_node = get_node(score_path)
	score_signal.connect(score_node.update_score)
	## Start game. 
	#start UI 
	#Start anyTImers and such
	spawn_NPC()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#every frame check user in  
	if(Input.is_action_just_pressed("esc")):
		print('pause the game!')
	if(Input.is_action_just_pressed("mask1")):
		print('mask1 selected')
		kill_npc()
		await get_tree().create_timer(1.0).timeout
		change_score(10)
	if(Input.is_action_just_pressed('mask2')):
		print('mask2 selected')
		kill_npc()
		await get_tree().create_timer(1.0).timeout
		change_score(-10)
	
	if(!active_guy):
		await get_tree().create_timer(2.0).timeout
		if(!active_guy): spawn_NPC()

func spawn_NPC():
	print('spawn an NPC')
	var npc = load("res://node_src/npc_node2d.tscn")
	#var npc = load("res://icon.tscn")
	npc = npc.instantiate()
	active_guy = npc
	get_tree().current_scene.add_child.call_deferred(npc)
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
