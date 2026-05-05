class_name PlayerWindow extends Button

@onready var player_name: Label = $PanelContainer/VBoxContainer/PlayerName
@onready var hp_label: Label = $PanelContainer/VBoxContainer/HP/Value
@onready var mp_label: Label = $PanelContainer/VBoxContainer/MP/Value

var data: BattleActor = null:
	set(value):
		if value:
			if value.is_connected("hp_changed", _on_data_hp_changed):
				value.hp_changed.disconnect(_on_data_hp_changed)
				
			data = value
			data.hp_changed.connect(_on_data_hp_changed)
			player_name.text = data.name
			hp_label.text = str(data.hp)
			mp_label.text = str(data.mp)
			show()
		else:
			hide()


func _on_data_hp_changed(hp: int, hp_max: int, value_change: int) -> void:
	print("yes")
	hp_label.text = str(hp)
