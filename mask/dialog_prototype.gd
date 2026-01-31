extends Node2D
var text_event = DialogicTextEvent.new()
var varient = null
var timeline_0 = null
var timeline_1 = null
var timeline_2 = null
var choice = "2"
var curr_time_line = 0
var active_character_tag

# Called when the node enters the scene tree for the first time.
func set_active_character(val):
	active_character_tag = val
func _ready() -> void:
	set_active_character(resources.character_tag_SOLDIER)
	start_encounter()
	pass
func start_encounter():
	curr_time_line = 0
	varient = randi()%len(resources.pre_dialog_options[active_character_tag])
	varient = randi()%len(resources.pre_dialog_options[active_character_tag])
	varient = randi()%len(resources.pre_dialog_options[active_character_tag])
	print(varient)
	build_pre_choice_timeline()
	timeline_1 = build_post_choice_timeline("1")
	timeline_2 = build_post_choice_timeline("2")

	
	timeline_0.events_processed = true
	Dialogic.start(timeline_0)
	Dialogic.connect("timeline_ended",on_timeline_ended)

	
	
	#Dialogic.start("test_character_timeline")
	pass # Replace with function body.
func build_pre_choice_timeline():
	var events = []
	var event = DialogicCharacterEvent.new()
	var character = resources.characters[active_character_tag]
	event.character = character
	events.push_back(event)
	var wait = DialogicWaitEvent.new()
	wait.time = 2
	events.push_back(wait)
	for option in resources.pre_dialog_options[active_character_tag][varient]:
		var pre_text_event = DialogicTextEvent.new()
		pre_text_event.character = character
		pre_text_event.text = option
		events.push_back(pre_text_event)
	wait = DialogicWaitEvent.new()
	wait.time = 1
	events.push_back(wait)
	var t_event = DialogicTextEvent.new()
	t_event.text = "I have the perfect mask for you"
	events.push_back(t_event)
	wait = DialogicWaitEvent.new()
	wait.time = 1
	events.push_back(wait)
	#var choice_event_1 = DialogicChoiceEvent.new()
	#choice_event_1.text = "present mask"
	#var choice_event_2 = DialogicChoiceEvent.new()
	#choice_event_2.text = "present mask 2"
	#events.push_back(choice_event_1)
	#events.push_back(choice_event_2)
	timeline_0 = DialogicTimeline.new()
	timeline_0.events = events
	###Construct time line and play timeline
func build_post_choice_timeline(choice):
	var timeline = null
	var events = []
	var event = DialogicCharacterEvent.new()
	var character = resources.characters[active_character_tag]
	event.character = character
	events.push_back(event)
	var wait = DialogicWaitEvent.new()
	wait.time = 1
	events.push_back(wait)
	for option in resources.get("post_mask_"+choice+"_dialog_options")[active_character_tag][varient]:
		var post_text_event = DialogicTextEvent.new()
		post_text_event.character = character
		post_text_event.text = option
		events.push_back(post_text_event)
	wait = DialogicWaitEvent.new()
	wait.time = 1
	events.push_back(wait)
	timeline = DialogicTimeline.new()
	timeline.events = events
	return timeline
var init_states = [false,false,false]

func on_timeline_ended():
	if curr_time_line==0:
		curr_time_line = -1
		if choice =="1":
			timeline_1.events_processed = true
			Dialogic.start(timeline_1)
		elif choice =="2":
			timeline_2.events_processed = true
			Dialogic.start(timeline_2)
			
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
