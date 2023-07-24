extends CharacterBody2D

const aceleracion = 25
const maxVelocidad = 90
const friccion = 90
var motion = Vector2()

func _physics_process(delta):
	var input = Vector2()
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input = input.normalized()
	if input != Vector2.ZERO:
		
		if input.x > 0: 
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("walk")
		else:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("walk")
		motion += input * aceleracion * delta
		motion = motion.limit_length(maxVelocidad*delta)
	else:
		$AnimatedSprite2D.play("idle")
		motion = motion.move_toward(Vector2.ZERO, friccion*delta)
		
	move_and_collide(motion)

