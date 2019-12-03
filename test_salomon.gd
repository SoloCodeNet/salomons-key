extends Node2D
onready var tilem = $TileMap
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$player.connect("action_1", self, "action1")
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func action1(posi:Vector2):
	var map_pos = tilem.world_to_map(posi)
	var index   = tilem.get_cellv(map_pos)
	match index:
		-1:
			tilem.set_cellv(map_pos, 0)
		0:
			tilem.set_cellv(map_pos, -1)
		1: 
			print("impossible de casser")
		
