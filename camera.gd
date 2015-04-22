
extends Camera2D

#This script keeps the camera X coord. the same as the ship's
var nave = null

func _ready():
	# Get a reference for the ship
	nave = get_node("/root/Parent/PlayScn/Nave")
	set_fixed_process(true)
	
func _fixed_process(delta):
	# Keep the camera Y axis aligned to the ship's 
	# so that the camera X coord. is the same as the ship's
	self.set_pos(Vector2(nave.get_pos().x,self.get_pos().y)) 


