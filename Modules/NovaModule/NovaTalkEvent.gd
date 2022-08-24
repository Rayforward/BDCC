extends EventBase

func _init():
	id = "NovaTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "yard_novaspot")

func run(_triggerID, _args):
	if(!GM.main.getFlag(NovaModule.Nova_Introduced)):
		saynn("You see some guard patrolling this zone")
	else:
		saynn("You see Nova patrolling this zone")
	if(getFlag(NovaModule.Nova_NotThereToday, false)):
		addDisabledButton("Nova", "She is not here today")
	else:
		addButtonUnlessLate("Nova", "Talk to the husky", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("NovaTalkScene")
