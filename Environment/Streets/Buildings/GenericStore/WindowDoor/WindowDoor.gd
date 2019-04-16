extends Spatial

var is_open = false;

func _process(_delta):
	if is_moving(): return;
	if is_open:
		if detects_person(): return;
		is_open = false;
		$Animation.play_backwards("open");
	else:
		if !detects_person(): return;
		is_open = true;
		$Animation.play("open");

func detects_person(): return !$Area.get_overlapping_bodies().empty();
func is_moving(): return $Animation.is_playing();