#from bge import logic
#from Common.Script.Utils.Timer import Timer
#from Common.Script.Actor.Profile import Triggers

var Profile_Actions = preload("Actor.Profile.Actions.gd").new().Profile_Actions
#var Profile_Triggers = preload("Actor.Profile.Triggers.gd").new()

var action = null
var final = 0.5

var rank = null
var value = null
var rate = null
var delay = null
var triggers = null
var event = null


func _init(_action):
	
	action = _action
	var attributes = Profile_Actions[action]
	
	for attribute in attributes:
		set(attribute, attributes[attribute])
	
	ResetTimer()
	

func IsTriggered(actor):
	
#	if not self.delay_timer.Tick():
#		return False
	
	if triggers == null:
		return true
	else:
		for trigger in triggers:
			if not true:#Profile_Triggers.call(trigger, actor):
				return true
			
	return true
	

func ResetTimer():
	
	pass#self.delay_timer = Timer('', self.delay, True)
	
	