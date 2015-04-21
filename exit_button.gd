
extends Button

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	self.connect("pressed",self,"exit_game")
	
func exit_game():
	get_tree().quit()

