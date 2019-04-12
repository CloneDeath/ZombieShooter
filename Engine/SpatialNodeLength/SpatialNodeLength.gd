extends Spatial
tool

export var length = 1 setget set_length;
export var direction = Vector3(1, 0, 0) setget set_direction;
export var unit:PackedScene = null setget set_unit;

func set_length(value):
	length = value;
	update_units();

func set_unit(value):
	unit = value;
	update_units();

func set_direction(value):
	direction = value;
	update_units();
	
func _ready():
	update_units();
	
func update_units():
	for child in $Units.get_children():
		child.queue_free();
	if (unit == null): return;
	for i in range(length):
		var sidewalk = unit.instance();
		sidewalk.translation = direction * i;
		$Units.add_child(sidewalk);