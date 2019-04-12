extends KinematicBody

var step_size = 0.2;
var distance_to_go = 1;
var speed = 1;

var health = 10;

func _physics_process(delta):
	if (distance_to_go <= 0): return;
	distance_to_go -= speed * delta;
	var actual_velocity = global_transform.basis.z;
	move_and_slide(actual_velocity * speed, Vector3(0, 1, 0));

func take_step():
	distance_to_go += step_size;

func damage(amount):
	health -= amount;
	if (health <= 0):
		queue_free();