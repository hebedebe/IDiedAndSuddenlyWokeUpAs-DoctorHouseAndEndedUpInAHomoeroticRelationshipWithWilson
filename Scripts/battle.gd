class_name Battle extends Control

const Actions = EventQueue.Actions

var action: Actions = Actions.FIGHT
var current_player_index: int = 0

@onready var event_queue: EventQueue = $EventQueue
@onready var options: Menu = $MarginContainer/Options
@onready var enemies: Menu = $Enemies
@onready var player_windows: PlayerWindows = $MarginContainer/PlayerWindows

func _ready() -> void:
	options.button_focus()
	#goto_next_player()

func goto_next_player(dir: int = 1) -> void:
	current_player_index += dir
	
	if current_player_index >= Data.party.size(): # The last party member has been selected
		for enemy: Enemy in enemies.get_buttons():
			var actor: BattleActor = enemy.data
			var target: BattleActor = Data.party.pick_random() #TODO actual targeting
			event_queue.add(Actions.FIGHT, actor, target) #TODO picking actions
		# TODO sort by speed rolls
		options.hide()
		enemies.release()
		await event_queue.run()
		current_player_index = 0

	@warning_ignore("int_as_enum_without_match")
	action = -1 as Actions
	options.button_focus()
	

func _on_options_button_pressed(button: BaseButton, _index: int) -> void:
	match button.text:
		"Fight":
			action = Actions.FIGHT
			enemies.button_focus()
		"Items":
			action = Actions.ITEM
			enemies.button_focus()
		"Malpractice":
			action = Actions.ITEM
			enemies.button_focus()
		"Flee":
			action = Actions.DEFEND
			enemies.button_focus()
		_: #Default case
			pass


func _on_enemies_button_pressed(button: BaseButton, _index: int) -> void:
	# Send action to the event queue
	var actor: BattleActor = Data.party[current_player_index]
	var target: BattleActor = button.data
	event_queue.add(action, actor, target)
	goto_next_player()
