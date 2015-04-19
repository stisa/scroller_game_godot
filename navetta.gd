
extends RigidBody2D

# comandi e controlli della nave
#TODO: forse dovrei occuparmi solo di su/giù e lasciare l'avanzamento allo rotazione?
var speed = 100.0
var oriz_direction = "none"
var vert_direction = "none"

func _ready():
	# Initialization here
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	#print(get_linear_velocity())
	if(get_linear_velocity().y < 400.0 && get_linear_velocity().y > -400.0):
		if(vert_direction=="up"):
			apply_impulse(get_pos(),Vector2(0.0,-speed))
		elif(vert_direction=="down"):
			apply_impulse(get_pos(),Vector2(0.0,speed))
	if(get_linear_velocity().x < 400.0 && get_linear_velocity().x > -400.0):
		if(oriz_direction=="left"):
			apply_impulse(Vector2(0,0),Vector2(-speed,0.0))
		elif(oriz_direction=="right"):
			apply_impulse(Vector2(0,0),Vector2(speed,0.0))
	#print(vert_direction +" - "+ oriz_direction)

func _input(event):
	if (event.type == InputEvent.SCREEN_TOUCH or event.type == InputEvent.MOUSE_BUTTON):
		print("Touched"+"-"+str(event.y))
		if(event.y < 640):
			vert_direction = "down"
		elif(event.y > 640):
			vert_direction = "up"
		else:
			vert_direction = "none"
		if(event.x > 360):
			oriz_direction = "left"
		elif(event.x < 360):
			oriz_direction = "right"
		else:
			oriz_direction = "none"
	else:
		oriz_direction = "none"
		vert_direction = "none"