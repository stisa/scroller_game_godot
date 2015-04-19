
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	set_fixed_process(true)
	
func _fixed_process(delta):
	if(Input.is_key_pressed(KEY_SPACE)):
		apply_impulse(get_pos(),Vector2(2.0,-10.0))
		#print(get_applied_force())


