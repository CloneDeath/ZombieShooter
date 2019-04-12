extends Spatial

func _process(_delta):
	if (Input.is_action_just_pressed("action_shoot")):
		fire_weapon();

func fire_weapon():
	$Animation.play("fire_weapon");
	$Animation.seek(0);
	$Ray.force_raycast_update();
	if ($Ray.is_colliding()):
		var body = $Ray.get_collider();
		if (body.has_method("damage")):
			body.damage(1);