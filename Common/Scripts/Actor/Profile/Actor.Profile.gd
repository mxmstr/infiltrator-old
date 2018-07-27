#from bge import logic
#from Common.Script import Globals
#from Common.Script.Actor.Profile.Action import Profile_Action
#from Common.Script.Actor.Profile.Actions import Profile_Actions
#from Common.Script.Actor.Actions import TriggerEvent
extends Node

var Profile_Actions = preload("Actor.Profile.Actions.gd").new().Profile_Actions
var Profile_Action = preload("Actor.Profile.Action.gd")

var value = null
var actions = null


func _ready():
	
	value = 0.5
	
	actions = []
	for action in Profile_Actions:
		actions.append(Profile_Action.new(action))
		
	#actions.sort(key = lambda x: x.rank, reverse=True)
	
	
func _process(delta):
	
	var active_actions = []
	var ranked_actions = []
	
	for action in actions:
		if action.IsTriggered(owner):
			active_actions.append(action)
			
	var max_rank = actions[0].rank
	
	for action in active_actions:
		if action.rank == max_rank:
			ranked_actions.append(action)
	
	
	for action in actions:
		
		if action.IsTriggered(owner):
			
			pass
#			if self.value < action.value:
#				self.value += (action.rate / 60) * (logic.getAverageFrameRate() / 60)
#				self.value = min(self.value, action.value)
#			elif self.value > action.value:
#				self.value -= (action.rate / 60) * (logic.getAverageFrameRate() / 60)
#				self.value = max(self.value, action.value)
#			elif action.event is not None:
#				event_name = action.event
#				name = event_name[event_name.find('_'):][1:]
#				type_ = event_name[:event_name.find('_')]
#				TriggerEvent(own, name, type_)
			
		else:
			action.ResetTimer()
	
#	display = Globals.Scene_UI.objects['Profile_Display_Start']
#	display.SetValue(value)
	
	