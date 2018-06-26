extends KinematicBody2D

var speed = 750

onready var spr = $Sprite
onready var cs = $CollisionShape2D

var object_hit 
var canMove = true

func _ready():
	pass

func movement(delta):
	var left = 0
	var right = 0
	var up = 0
	var down = 0
	var horizontal = 0
	var vertical = 0
	
	#TVControl
	if canMove:
		# Movimentacao por WASD
		if Input.is_action_pressed("ui_left"):
			left = -1
			spr.texture = load("res://Sprites/Player/jogador_2_side.png")
			spr.set_flip_h(true)
		if Input.is_action_pressed("ui_right"):
			right = 1
			spr.texture = load("res://Sprites/Player/jogador_2_side.png")
			spr.set_flip_h(false)
		if Input.is_action_pressed("ui_up"):
			up = -1
			spr.texture = load("res://Sprites/Player/jogador_2_back.png")
		if Input.is_action_pressed("ui_down"):
			down = 1
			spr.texture = load("res://Sprites/Player/jogador_2.png")
	
	# Avoid faster movement when in diagonal
	horizontal = left + right
	vertical = up + down
	var sum = sqrt(abs(horizontal) + abs(vertical))
	if sum == 0:
		sum = 1
	object_hit = move_and_collide(Vector2(speed * delta * horizontal/sum, speed * delta * vertical/sum))

func checkCollision():
	# Set position
	if object_hit != null:
		object_hit = object_hit.get_collider()
		# Pegar chave
		if object_hit.get_name() == "Key":
			object_hit.queue_free()
		if object_hit.is_in_group("key"):
			object_hit.queue_free()

func reset(): #Se for pego
	canMove = true
	Global.set_player_position(405,980)

func _physics_process(delta):
	movement(delta)
	checkCollision()