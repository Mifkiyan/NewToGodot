extends KinematicBody2D
var health = 3

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	pass
	
func _on_Hitbox_body_entered(body):
	if body.is_in_group("Player"):
		if body.position.angle_to_point(self.position) > -2 and body.position.angle_to_point(self.position) < -1:
			health -= 1
			if health <= 0:
				queue_free()
				
