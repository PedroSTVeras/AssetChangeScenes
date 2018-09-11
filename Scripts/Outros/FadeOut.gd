extends Node2D

onready var timer = $Timer
onready var poly = $Polygon2D

func _ready():
	pass

	#aaaaa
	
func _physics_process(delta):
	poly.color.a = timer.wait_time - timer.get_time_left()
	if timer.get_time_left() < 0.3:
		poly.color.a = 1