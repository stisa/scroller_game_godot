
extends RigidBody2D

# Variables to easily change mass and applied force for the cubes
var delta_massa= 3.0
var delta_force = 60.0


func _ready():
	# Random mass
	self.set_mass(rand_range(delta_massa,delta_massa+15))
	#Random force
	self.apply_impulse(self.get_pos(),Vector2(rand_range(-delta_force,delta_force),rand_range(-delta_force,delta_force)))
	
func _enter_tree():
	set_fixed_process(true)
	
func _fixed_process(delta):
	#Destroy the cube if it's further than 1300 from the ship
	if(self.get_pos().distance_to(get_node("/root/Parent/Nave").get_pos())>1300):
		#print(self.get_pos().distance_to(get_node("/root/Parent/Nave").get_pos()))
		#print("Destroyed"+self.get_name())
		self.get_parent().spawnCount -=1
		self.get_parent().remove_and_delete_child(self)
		