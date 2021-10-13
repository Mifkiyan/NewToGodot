extends Control

export (NodePath) var PlayerPath
onready var Player = get_node(PlayerPath)


func _physics_process(delta):
	$Label.text = "Health : " + str(Player.health)
