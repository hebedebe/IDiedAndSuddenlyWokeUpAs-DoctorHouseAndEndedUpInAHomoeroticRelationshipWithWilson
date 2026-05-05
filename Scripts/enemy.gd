class_name Enemy extends TextureButton

@export var data: BattleActor = null : 
	set(value):
		data = value.copy()
		data.hp_changed.connect(_on_data_hp_changed)
		if data and enemy_name:
			enemy_name.text = data.name
		# TODO update sprite
		# etc

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var enemy_name: Label = $PanelContainer/EnemyName

func _ready() -> void:
	animation_player.play("RESET")
	enemy_name.text = data.name

func _on_focus_entered() -> void:
	animation_player.play("highlight")

func _on_focus_exited() -> void:
	animation_player.play("RESET")

func _on_data_hp_changed(hp: int, _hp_max: int, _value_change: int) -> void:
	if hp <= 0:
		queue_free()
