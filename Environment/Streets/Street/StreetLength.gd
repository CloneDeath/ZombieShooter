extends "res://Engine/SpatialNodeArea/SpatialNodeArea.gd"
tool

export var divider_unit:PackedScene = null setget set_divider_unit;

func set_divider_unit(value):
	divider_unit = value;
	_needs_update = true;

func update_units():
	for child in $Units.get_children():
		child.queue_free();
	if (unit == null): return;
	for l1 in range(length1):
		for l2 in range(length2):
			var entity = null;
			if (l2 == int(length2/2)):
				entity = divider_unit.instance();
			else:
				entity = unit.instance();
			entity.set_meta("_edit_lock_", true);
			entity.translation = direction1 * l1 + direction2 * l2;
			$Units.add_child(entity);