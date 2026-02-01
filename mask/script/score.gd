extends Node2D


var score = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("score").text = "  score = " + str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update_score(update_by):
	score += update_by
	get_node("score").text = "  score = " + str(score)

func update_message(msg):
	get_node("score").text = str(msg)
