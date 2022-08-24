extends EventBase

func _init():
	id = "testEvent"

func registerTriggers(es):
	#es.addTrigger(self, Trigger.EnteringRoom, "hall_mainentrance")
	es.addTrigger(self, Trigger.CaughtOffLimits)

func react(_triggerID, _args):
	if(true):
		return false
	
	GM.pc.addLust(-100)
	GM.pc.addLust(69)
	
	runScene("FightScene", ["risha"], "rishafight")
	return true

func getPriority():
	return -1
