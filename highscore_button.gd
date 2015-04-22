
extends Button

# member variables here, example:
# var a=2
# var b="textvar"
var root= null

func _ready():
	connect("pressed",self,"load_highscore")
	root = get_node("/root/Parent/")

func load_highscore():
	if root:
		get_node("/root/Singleton/").destroy_from(root,1,"res://highscoreScn.scn")
	