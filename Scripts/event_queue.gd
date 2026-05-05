class_name EventQueue extends Node

enum Actions {
	FIGHT,
	DEFEND,
	ITEM
}

var events: Array[Dictionary] = []

func add(action: Actions, actor: BattleActor, target: BattleActor) -> void:
	events.append(
		{
			"action": action, 
			"actor": actor, 
			"target": target
		}
	)
	print("Adding event: ", actor.name, " ", Actions.keys()[action], " ", target.name, ".")

func run() -> void:
	if events.is_empty():
		return
	
	var event: Dictionary = events.pop_front()
	var action: Actions = event.action
	var actor: BattleActor = event.actor
	var target: BattleActor = event.target
	
	print("Adding event: ", actor.name, " ", Actions.keys()[action], " ", target.name, ".")
	
	match event.action:
		Actions.FIGHT:
			target.healhurt(-1)
			print(target.hp)
		_:
			pass

	await get_tree().create_timer(0.5).timeout
	run()
