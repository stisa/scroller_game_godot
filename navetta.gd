
extends RigidBody2D

# This script hold the ship's speed and controls

# Ship's force. Watch out, it's applied with an impulse  
# so it can behave differently for different inputs 
# I think it depends on how long the input is recognized
var speed = 100.0 
var maxSpeed = 400.0 # Max speed the ship can go, after this I avoid applying forces
var oriz_direction = "none"
var vert_direction = "none"

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	# Avoid the ship's exceeding %maxSpeed%
	if(self.get_linear_velocity().y < maxSpeed && self.get_linear_velocity().y > -maxSpeed):
		if(vert_direction=="up"):
			self.apply_impulse(get_pos(),Vector2(0.0,-speed))
		elif(vert_direction=="down"):
			self.apply_impulse(get_pos(),Vector2(0.0,speed))
	if(self.get_linear_velocity().x < maxSpeed && self.get_linear_velocity().x > -maxSpeed):
		if(oriz_direction=="left"):
			self.apply_impulse(Vector2(0,0),Vector2(-speed,0.0))
		elif(oriz_direction=="right"):
			self.apply_impulse(Vector2(0,0),Vector2(speed,0.0))
	
func _input(event):
	if (event.type == InputEvent.SCREEN_TOUCH or event.type == InputEvent.MOUSE_BUTTON):
		# Upper half of the screen is down, lower half is up
		if(event.y < 640):
			vert_direction = "down"
		elif(event.y > 640):
			vert_direction = "up"
		else:
			vert_direction = "none"
		# Right half of the screen is left, left half is right	
		if(event.x > 360):
			oriz_direction = "left"
		elif(event.x < 360):
			oriz_direction = "right"
		else:
			oriz_direction = "none"
	else:
		oriz_direction = "none"
		vert_direction = "none"