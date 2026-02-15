extends CharacterBody2D
var speed:=0.0
var speedModifier=3;
func _physics_process(delta: float) -> void:
	if(Input.is_action_pressed("Accelerate")):
		speed+=delta*20
		if(speed>100):
			speed=100
	else:
		speed*=.99
	if(Input.is_action_pressed("Decelerate")):
		speed-=delta*25
		if(speed<0):
			speed=0
	if(Input.is_action_pressed("Left")):
		rotation-=delta*5
	if(Input.is_action_pressed("Right")):
		rotation+=delta*5
	var direction = Vector2.UP.rotated(rotation)
	velocity = direction * speed * speedModifier
	move_and_slide()
	calculateBoosters()

func calculateBoosters():
	for child in $"Engine Effects".get_children():
		child.emitting=false
	if(speed>10):
		$"Engine Effects/CPUParticles2D".emitting=true
	if(speed>20):
		$"Engine Effects/CPUParticles2D2".emitting=true
	if(speed>30):
		$"Engine Effects/CPUParticles2D3".emitting=true
	if(speed>40):
		$"Engine Effects/CPUParticles2D4".emitting=true
	if(speed>50):
		$"Engine Effects/CPUParticles2D5".emitting=true
	if(speed>60):
		$"Engine Effects/CPUParticles2D6".emitting=true
	if(speed>70):
		$"Engine Effects/CPUParticles2D7".emitting=true
	if(speed>80):
		$"Engine Effects/CPUParticles2D8".emitting=true
	if(speed>90):
		$"Engine Effects/CPUParticles2D9".emitting=true
	if(speed>100):
		$"Engine Effects/CPUParticles2D10".emitting=true
	
