#from Common.Script.AI.Event.Events import Event_Properties
#from Common.Script.AI.Event.Tree.Trees import Result_Trees
#from Common.Script.AI.Event.Result.Result import AI_Result
#from Common.Script.Actor.Actions import *
var AI_Events = preload("AI.Events.gd").new().AI_Events

var event = null
var type = null
var object = null
var npcs_examining = []
var npcs_examined = []
var timer = null

var trigger = null
var rank = null
var expiration_time = null
var trigger_delay = null
var can_invalidate = null
var simultaneous_examination = null
var repeat_examination = null
var sight_range = null
var xray_range = null
var examine_dist = null
var suspicion = null
var anxiety = null
var identity = null


func _init(_event, _type, _object):
	
	event = _event
	type = _type
	object = _object
	
	var event = AI_Events[_type][_event]
	
	for attribute in event:
		set(attribute, event[attribute])
	
	if timer != null:
		var root = get_node('/root')
		timer = Timer.new()
		add_child(timer)
		timer.wait_time = expiration_time
		timer.one_shot = true
		timer.autostart = true
		timer.connect("timeout", root, "OnEventExpired", [self])
		timer.start()
		