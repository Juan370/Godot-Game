extends KinematicBody2D

var velocity = Vector2.ZERO
var move_speed = 480
var gravity = 1200
var jump_force = -980
var is_grounded
onready var raycasts = $raycasts

func _physics_process(delta: float) -> void:
	
	velocity.y += gravity * delta     #adicionando gravidade
	
	_get_input()

	velocity = move_and_slide(velocity)
	
	is_grounded = _check_is_ground()
	
	_set_animation()
	
func _get_input():
	velocity.x = 0
	var move_direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 1)
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up") and is_grounded:
		velocity.y = jump_force / 2
		
func _check_is_ground():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false

func _set_animation():
	var AnimationPlayer = "parado"
	
	if !is_grounded:
		AnimationPlayer = "pulando"
	elif velocity.x != 0:
		AnimationPlayer = "andando"
	
	if $AnimationPlayer.assigned_animation != AnimationPlayer:
		$AnimationPlayer.play(AnimationPlayer)
