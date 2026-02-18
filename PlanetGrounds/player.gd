extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -250.0

var sprite: AnimatedSprite2D

func _ready() -> void:
	sprite=$AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if(velocity.x<0 and sprite.flip_h==false):
		sprite.flip_h=true
		sprite.play("turn")
	if(velocity.x>0 and sprite.flip_h):
		sprite.flip_h=false
		sprite.play("turn")
	if(abs(velocity.x)>0 and sprite.animation!="walk" and sprite.animation!="turn"):
		sprite.play("walk")
	if(velocity.x==0 and sprite.animation!="turn"):
		sprite.play("idle")


func _on_animated_sprite_2d_animation_finished() -> void:
	sprite.play("idle")
