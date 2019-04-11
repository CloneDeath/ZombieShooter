extends KinematicBody

export var Sensitivity_X = 0.01
export var Sensitivity_Y = 0.01
export var Invert_Y_Axis = false
export var Exit_On_Escape = true
export var Maximum_Y_Look = 45
export var Accelaration = 5.0
export var Maximum_Walk_Speed = 10.0
export var Jump_Speed = 2.0

const GRAVITY = 9.8
var velocity = Vector3(0,0,0)
var forward_velocity = 0
var Walk_Speed = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	forward_velocity = Walk_Speed

func _process(delta):
	if Exit_On_Escape:
		if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()
	
func _physics_process(delta):
	velocity.y -= GRAVITY * delta
	
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
		Walk_Speed += Accelaration * delta
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = -global_transform.basis.z.x * Walk_Speed
		velocity.z = -global_transform.basis.z.z * Walk_Speed
	if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
		Walk_Speed += Accelaration * delta
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = global_transform.basis.z.x * Walk_Speed
		velocity.z = global_transform.basis.z.z * Walk_Speed
	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		Walk_Speed += Accelaration * delta
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = -global_transform.basis.x.x * Walk_Speed
		velocity.z = -global_transform.basis.x.z * Walk_Speed
		
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		Walk_Speed += Accelaration * delta
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = global_transform.basis.x.x * Walk_Speed
		velocity.z = global_transform.basis.x.z * Walk_Speed
		
	if not(Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_RIGHT)):
		velocity.x = 0
		velocity.z = 0
		Walk_Speed = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = Jump_Speed
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-Sensitivity_X * event.relative.x)
