extends Spatial
tool

export var length1 = 1 setget set_length1;
export var direction1 = Vector3(1, 0, 0) setget set_direction1;
export var length2 = 1 setget set_length2;
export var direction2 = Vector3(0, 0, 1) setget set_direction2;
export var unit:PackedScene = null setget set_unit;
var _needs_update = false;

func set_length1(value):
	length1 = value;
	_needs_update = true;

func set_length2(value):
	length2 = value;
	_needs_update = true;

func set_unit(value):
	unit = value;
	_needs_update = true;

func set_direction1(value):
	direction1 = value;
	_needs_update = true;

func set_direction2(value):
	direction2 = value;
	_needs_update = true;
	
func _ready():
	_needs_update = true;

func _process(_delta):
	if (_needs_update):
		_needs_update = false;
		update_units();
	
func update_units():
	for child in $Units.get_children():
		child.queue_free();
	if (unit == null): return;
	for l1 in range(length1):
		for l2 in range(length2):
			var entity = unit.instance();
			entity.translation = direction1 * l1 + direction2 * l2;
			entity.set_meta("_edit_lock_", true);
			$Units.add_child(entity);