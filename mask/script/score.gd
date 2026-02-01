extends Node2D


var score = 40
var suspect = 20
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("score").text = "  moral = " + str(score) + " suspicion = " + str(suspect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update_score(update_by):
	score += update_by
	get_node("score").text = "  moral = " + str(score) + " suspicion = " + str(suspect)

func update_message(msg):
	get_node("score").text = str(msg)

func update_suspect(update_to):
	suspect = update_to
	get_node("score").text = "  moral = " + str(score) + " suspicion = " + str(suspect)
