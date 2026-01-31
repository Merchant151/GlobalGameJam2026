extends Node

var character_tag_BALD_MAN = "bald_man"
var character_tag_SOLDIER = "soldier"
var character_tag_WOMAN = "woman"
var characters = {
	character_tag_BALD_MAN: preload("res://characters/test_character1.dch"),
	character_tag_SOLDIER: preload("res://characters/soldier_character.dch")
	}
	
var pre_dialog_options = {
	character_tag_SOLDIER:[
		["I never thought i'd join the war.", "But when big brother made the call, of course i had to answer.", "But anyways I am in need of a mask"],
		["The war was terrible.", "So much carnage", "I was told i need a new mask, but i'm not sure of anything anymore."]],
	character_tag_BALD_MAN:[
		["Its hard being as handsome as I am"," No if you are wondering I am not balding","Anyways it's none of your business. Just sell me a mask"],
		["Life is quite hard these days.","My wife says I've allowed the stress to get to me but I am still who I am.","I just wish these masks weren't nece-.","Apologies. One mask please"]
	]
	
}
var post_mask_1_dialog_options = {
	character_tag_SOLDIER:[
		["Oh how perfect.", "Thank you seller." ,"Lo Big Brother and good day to you."],
		["Ah.", "I see.", "Thank you I geuss."]],
	character_tag_BALD_MAN:[["Hmm. it will do.", "Lo Big Brother"],
		["Oh. That is a choice.", "Thank you and goodbye"]]
	
}
var post_mask_2_dialog_options = {
	character_tag_SOLDIER:[
		["No No this can't be right.", "You are most unreputable." ,"Good day to you. and may we never coss paths again."],
		["wha-", "Are you sure?", "Thank you my friend. Shall we meet again."]],
	character_tag_BALD_MAN:[
		["My word, this is hideous", "You'll be hearing complaints from me"],
		["Oh. How surprising", "But I quite  like it", "Thank you"]
		
	]
	
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
