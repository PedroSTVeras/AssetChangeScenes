extends Node2D

onready var start_continue_button = $initialBackground/start_continue
onready var options_button = $initialBackground/options
onready var quit_button = $initialBackground/quit

onready var confirm_menu = $initialBackground/confirm

onready var yes_button = $initialBackground/confirm/yes
onready var no_button = $initialBackground/confirm/no

func _ready():
	start_continue_button.connect("pressed", self, "start_game")
	options_button.connect("pressed", self, "show_options", [options_button])
	quit_button.connect("pressed", self, "show_confirm_menu")
	
	yes_button.connect("pressed", self, "quit_game")
	no_button.connect("pressed", self, "hide_confirm_menu")
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if !confirm_menu.visible:
			start_game()
		else:
			quit_game()
	if Input.is_action_just_pressed("ui_cancel"):
		if !confirm_menu.visible:
			show_confirm_menu()
		else:
			hide_confirm_menu()
	pass

func start_game():
	Global._player.reset()
	get_tree().change_scene("res://Scenes/Salas/QuartoPlayer.tscn")

func show_options(target):
	print("Clicou no botão " + target.get_name())

func show_confirm_menu():
	confirm_menu.show()

func hide_confirm_menu():
	confirm_menu.hide()

func quit_game():
	get_tree().quit()