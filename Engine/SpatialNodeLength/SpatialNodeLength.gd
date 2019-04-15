extends Spatial
tool

export var length = 1 setget set_length;
export var direction = Vector3(1, 0, 0) setget set_direction;
export var unit:PackedScene = null setget set_unit;
var _needs_update = false;

func set_length(value):
	length = value;
	_needs_update = true;

func set_unit(value):
	unit = value;
	_needs_update = true;

func set_direction(value):
	direction = value;
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
	for i in range(length):
		var entity = unit.instance();
		entity.translation = direction * i;
		entity.set_meta("_edit_lock_", true);
		$Units.add_child(entity);