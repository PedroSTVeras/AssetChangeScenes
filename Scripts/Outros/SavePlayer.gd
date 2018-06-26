extends Node2D

func _ready():
	add_child(Global._player)
	
func _exit_tree():
	remove_child(Global._player)