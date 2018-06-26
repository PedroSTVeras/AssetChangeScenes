extends Area2D

onready var mae = preload("res://Scenes/Inimigos/EnemyMae2.tscn")
onready var collision = $CollisionShape2D
onready var sprite = $Sprite
onready var nav = get_node("../Nav")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if Global._stage > 0:
		sprite.texture = load("res://Sprites/Itens/Door.png")
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass

func _on_SaidaDoJogo_body_shape_entered(body_id, body, body_shape, area_shape):
	if Global._stage == 0:
		if body.get_name() == "Player":
			#Troca sprite da porta
			sprite.texture = load("res://Sprites/Itens/Door.png")
			#Spawna mae
			var m = mae.instance()
			add_child(m)
			m.goal = Global._player.position
			m.nav = nav
			#Troca estágio
			Global._stage = 1
	pass # replace with function body
