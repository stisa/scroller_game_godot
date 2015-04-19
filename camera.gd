
extends Camera2D

#This script keeps the camera X coord. the same as the ship's
var nave = null

func _ready():
	nave = self.get_parent().get_child(3) #Get a reference for the ship
	set_fixed_process(true)
	
func _fixed_process(delta):
	# Keep the camera Y axis aligned to the ship's 
	# so that the camera X coord. is the same as the ship's
	self.set_pos(Vector2(nave.get_pos().x,self.get_pos().y)) 


