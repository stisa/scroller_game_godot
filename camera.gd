
extends Camera2D

# member variables here, example:
# var a=2
# var b="textvar"
var nave = null

func _ready():
	nave = get_parent().get_child(3)
	set_fixed_process(true)
	
func _fixed_process(delta):
	self.set_pos(Vector2(nave.get_pos().x,self.get_pos().y))


