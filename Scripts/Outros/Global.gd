extends Node

var _player_type = preload("res://Scenes/Player/Player.tscn")

var _player
var _stage
var _key_1 = false

func _ready():
	_stage = 0
	_player = _player_type.instance()

func set_player_position(x,y):
	_player.position.x = x
	_player.position.y = y