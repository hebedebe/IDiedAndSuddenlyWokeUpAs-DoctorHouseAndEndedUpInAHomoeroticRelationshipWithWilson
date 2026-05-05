class_name Enemy extends TextureButton

@export var data: BattleActor = null : 
	set(value):
		data = value.copy()
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
