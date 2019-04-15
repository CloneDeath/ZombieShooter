extends Spatial
tool

export var size:Vector3 = Vector3(10, 10, 10) setget set_size;
var _needs_update = false;

func set_size(value):
	size = value;
	_needs_update = true;

func _ready():
	_needs_update = true;

func _process(_delta):
	if (_needs_update):
		_needs_update = false;
		update_units();

func update_units():
	update_units_height();
	update_units_lengths();
	update_units_positions();

func update_units_height():
	$WallS.length2 = size.y;
	$WallE.length2 = size.y;
	$WallN.length2 = size.y;
	$WallW.length2 = size.y;
	$CornerSW.length = size.y;
	$CornerSE.length = size.y;
	$CornerNE.length = size.y;
	$CornerNW.length = size.y;
	
func update_units_lengths():
	$WallS.length1 = size.x - 2;
	$WallE.length1 = size.z - 2;
	$WallN.length1 = size.x - 2;
	$WallW.length1 = size.z - 2;

func update_units_positions():
	$WallN.translation = Vector3(size.x-2, 0, 0);
	$WallE.translation = Vector3(size.x-1, 0, size.z-2);
	$WallS.translation = Vector3(1, 0, size.z-1);
	$WallW.translation = Vector3(0, 0, 1);
	$CornerNW.translation = Vector3(0, 0, 0);
	$CornerNE.translation = Vector3(size.x-1, 0, 0);
	$CornerSE.translation = Vector3(size.x-1, 0, size.z-1);
	$CornerSW.translation = Vector3(0, 0, size.z-1);