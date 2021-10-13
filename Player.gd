extends KinematicBody2D

var velocity :Vector2
var speed = 200
var InitialPosition
var health = 10

func _input(_event):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	InitialPosition = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	
	if position.y > 800:
		position = InitialPosition
	
	
	velocity.x = 0
	if Input.is_action_pressed("Right"):
		velocity.x += 1
	elif Input.is_action_pressed("Left"):
		velocity.x += -1
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = -240
		
	velocity.x = velocity.x * speed
	velocity.y += 500*delta
	
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	if (velocity.x):
		$AnimatedSprite.animation = "Gerak"
		if (velocity.x < 0):
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.animation = "Idle"
		
		

func _on_Hitbox_body_entered(body):
	if body.is_in_group("Enemies"):
		health -= 2
		if health <= 0:
			get_tree().reload_current_scene()
