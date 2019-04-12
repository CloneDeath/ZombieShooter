extends Spatial
tool

export var length1 = 1 setget set_length1;
export var direction1 = Vector3(1, 0, 0) setget set_direction1;
export var length2 = 1 setget set_length2;
export var direction2 = Vector3(0, 0, 1) setget set_direction2;
export var unit:PackedScene = null setget set_unit;

func set_length1(value):
	length1 = value;
	update_units();

func set_length2(value):
	length2 = value;
	update_units();

func set_unit(value):
	unit = value;
	update_units();

func set_direction1(value):
	direction1 = value;
	update_units();

func set_direction2(value):
	direction2 = value;
	update_units();
	
func _ready():
	update_units();
	
func update_units():
	for child in $Units.get_children():
		child.queue_free();
	if (unit == null): return;
	for l1 in range(length1):
		for l2 in range(length2):
			var entity = unit.instance();
			entity.translation = direction1 * l1 + direction2 * l2;
			$Units.add_child(entity);