extends Sprite

onready var resume_button = $Sprite/resume
onready var options_button = $Sprite/options
onready var quit_button = $Sprite/quit

onready var confirm_menu = $Sprite/confirm

onready var yes_button = $Sprite/confirm/yes
onready var no_button = $Sprite/confirm/no

func _ready():
	resume_button.connect("pressed", self, "resume_game")
	options_button.connect("pressed", self, "show_options", [options_button])
	quit_button.connect("pressed", self, "quit_game")
	
	yes_button.connect("pressed", self, "quit_game")
	no_button.connect("pressed", self, "hide_confirm_menu")
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"): #Tecla esc
		if !self.visible: #abrir menu
			get_tree().paused = true
			self.show()
		elif self.visible: #fechar menu
			get_tree().paused = false
			self.hide()
	if Input.is_action_just_pressed("ui_accept"):
		if confirm_menu.visible:
			quit_game()

func resume_game():
	self.hide()

func show_options(target):
	print("Clicou no botão " + target.get_name())

func show_pause_background_sprite():
	self.show()

func hide_pause_background_sprite():
	self.hide()

func show_confirm_menu():
	confirm_menu.popup()

func hide_confirm_menu():
	confirm_menu.hide()

func quit_game():
	get_tree().paused = false
	self.hide()
	get_tree().change_scene("res://Scenes/Main.tscn")