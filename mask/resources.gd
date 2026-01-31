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
		["The war was terrible.", "So much carnage", "I was told i need a new mask, but i'm not sure of anything anymore."]]
	
}
var post_mask_1_dialog_options = {
	character_tag_SOLDIER:[
		["Oh how perfect.", "Thank you seller." ,"Lo Big Brother and good day to you."],
		["Ah.", "I see.", "Thank you I geuss."]]
	
}
var post_mask_2_dialog_options = {
	character_tag_SOLDIER:[
		["No No this can't be right.", "You are most unreputable." ,"Good day to you. and may we never coss paths again."],
		["wha-", "Are you sure?", "Thank you my friend. Shall we meet again."]]
	
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
