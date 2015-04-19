
extends RigidBody2D

# randomizza velocità,massa dell'ostacolo
var delta_massa= 3.0#get_name().delta_massa
var delta_force = 60.0#get_parent().delta_force


func _ready():
	# Random massa
	set_mass(rand_range(delta_massa,delta_massa+15))
	#print(get_mass())
	#Random force
	set_applied_force(Vector2(rand_range(-delta_force,delta_force),rand_range(-delta_force,delta_force)))
	
func _enter_tree():
	set_fixed_process(true)
	
func _fixed_process(delta):
	#Destroy the cube if it's further than 1300 from the ship
	if(self.get_pos().distance_to(get_node("/root/Parent/Nave").get_pos())>1300):
		#print(self.get_pos().distance_to(get_node("/root/Parent/Nave").get_pos()))
		#print("Destroyed"+self.get_name())
		get_parent().spawnCount -=1
		get_parent().remove_and_delete_child(self)
		