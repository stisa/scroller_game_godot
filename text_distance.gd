
extends Label


var nave = null
var distance = null
func _ready():
	nave = get_node("/root/Parent/Nave/") 
	set_fixed_process(true)

func _fixed_process(delta):
	self.set_text(str(floor(nave.countToDeath)))


