class_name BattleActor extends Resource

signal hp_changed(hp: int, hp_max: int, amount_changed: int)

@export var name: String = ""
@export var hp_max: int = 1
@export var mp_max: int = 1

var hp: int = -1
var mp: int = -1


func init() -> void:
	hp = hp_max
	mp = mp_max
	
func copy() -> BattleActor:
	var dup = duplicate()
	dup.init()
	return dup

func healhurt(value: int) -> void:
	var previous_hp: int = hp
	hp = clampi(hp + value, 0, hp_max)
	hp_changed.emit(hp, hp_max, previous_hp - hp)
	print(name, " ", hp)
