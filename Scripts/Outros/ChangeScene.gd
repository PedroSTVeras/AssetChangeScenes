extends Area2D

export(int) var player_x
export(int) var player_y
export(bool) var usesKey
export(String) var path
export(String) var PortaFechada
export(String) var PortaAberta
export(String) var playerName
export(NodePath) var key

onready var sprite = $Sprite
onready var porta = $PortaFechada

func _ready():
	pass

func _process(delta):
	if usesKey: #Fechado
		sprite.texture = load(PortaFechada)
		if !has_node(key):
			usesKey = false
	
	else: #Aberto
		sprite.texture = load(PortaAberta)
		if has_node("PortaFechada"):
			porta.queue_free()
	pass

func _on_Door_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.get_name() == playerName:
		body.position = Vector2(player_x,player_y)
		get_tree().change_scene(path)
	pass