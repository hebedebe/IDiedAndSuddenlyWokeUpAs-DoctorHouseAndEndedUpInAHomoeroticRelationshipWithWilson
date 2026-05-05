class_name Enemy extends TextureButton

@export var data: BattleActor = null : 
	set(value):
		data = value.copy()
		# TODO update sprite
		# etc

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("RESET")

func _on_focus_entered() -> void:
	animation_player.play("highlight")

func _on_focus_exited() -> void:
	animation_player.play("RESET")
