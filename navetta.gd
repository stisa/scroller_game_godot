
extends RigidBody2D

# This script hold the ship's speed and controls

# Ship's force. Watch out, it's applied with an impulse  
# so it can behave differently for different inputs 
# I think it depends on how long the input is recognized
var speed = 60.0 
var maxSpeed = 400.0 # Max speed the ship can go, after this I avoid applying forces
var lastPos = 0 # last position, used to check if the ship is moving forward
var countToDeath = 0 # counter that increases if the player dosen't move or moves backwards
func _ready():
	set_fixed_process(true)
	set_process_input(true)
	lastPos = self.get_pos()
	
func _fixed_process(delta):
	if(self.get_pos()<=lastPos): # if the ship hasn't moved
		countToDeath += delta    # increment counter
		# What happens if countToDeath is over 5s is defined in main.gd, essentially: game over
	else:
		countToDeath = 0		 # reset counter
		lastPos = self.get_pos() # update lastPos
	
func _input(event):

	if (event.type == InputEvent.SCREEN_TOUCH or event.type == InputEvent.MOUSE_BUTTON):
		# Avoid the ship's exceeding %maxSpeed%
		if(self.get_linear_velocity().y < maxSpeed && self.get_linear_velocity().y > -maxSpeed):
			if(event.y < 1000 && event.y > 300):	
				if(event.y < self.get_pos().y):
					self.apply_impulse(get_pos(),Vector2(0.0,speed))
				elif(event.y > self.get_pos().y):
					self.apply_impulse(get_pos(),Vector2(0.0,-speed))
			elif(event.y>1000):
				self.apply_impulse(get_pos(),Vector2(0.0,-speed))
			elif(event.y <300):
				self.apply_impulse(get_pos(),Vector2(0.0,speed))
				
		if(self.get_linear_velocity().x < maxSpeed && self.get_linear_velocity().x > -maxSpeed):
			# Right half of the screen is left, left half is right	
			if(event.x > 360):
				self.apply_impulse(Vector2(0,0),Vector2(-speed,0.0))
			elif(event.x < 360):
				self.apply_impulse(Vector2(0,0),Vector2(speed,0.0))
	