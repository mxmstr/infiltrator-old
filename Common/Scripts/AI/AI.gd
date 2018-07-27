extends Node

var AI_Tree = preload("Event/Tree/AI.Event.Tree.gd")
var Conflict_State = preload("Conflict/AI.Conflict.State.gd")

var suspicion = 0.0
var anxiety = 0.0
var identity = 0

var conflict = null
var event = null
var event_queue = []
var result_node = null
var result_timer = null
var result_var_stack = []
var player_last_pos = []
var target = null
var route_index = 0
var roam_route = []
var current_route = []
var current_path = []


func _ready():
	
	conflict = Conflict_State.new('Pass')
#	for player in Globals.EventManager.PlayerList:
#		player_last_pos.append(player)
#
#	for obj in logic.getCurrentScene().objects:
#		if self['path'] in obj.name:
#			route_stops.append(obj)
#
#	for i in list(range(len(route_stops))):
#		self.roam_route.append(
#			logic.getCurrentScene().objects[self['path'] + str(i + 1)]
#			)
#
#	current_route = roam_route.duplicate()
#	ChangeConflictState(self, 'Pass')


func AppendEventQueue(new_event):
	
	for item in event_queue:
		var event = item[0]
		if event.name == new_event.name and event.object == new_event.object:
			return
		
	#event_queue.append((new_event, Timer('', new_event.trigger_delay)))


func ScanEvents():
	
	for event in Globals.EventManager.AIEventList:
		AppendEventQueue(event)
	
	var event_to_start = null
	var queue = event_queue.duplicate()
	
	for item in queue:
		var event = item[0]
		var timed_out = false#item[1].Tick()
		
		if false:#EventIsInvalid(event):
			event_queue.remove(item)
		elif timed_out:
			if false:#EventIsValid(own, event):
				event_to_start = event
			event_queue.remove(item)
			
	if event_to_start != null:
		if event != null:
			result_node.ExitTree(owner)
		StartEvent(event_to_start)
			

func StartEvent(event):
	
	event = event
	event.npcs_examining.append(owner)
	event.npcs_examined.append(owner)
	
	result_node = AI_Tree.new(event.type + '_' + event.name).root#copy.deepcopy(GetEventTree(event.type + '_' + event.name)).root
	result_var_stack.append(null)
	result_node.StartEventResult(owner)


func ResetEvent():
	
	event.npcs_examining.remove(owner)
	event = null
	result_node = null
	result_var_stack = []
	target = null

	
func ExecuteEvent():
		
#	 for index, player in enumerate(Globals.EventManager.PlayerList):
#		 if IsVisible(own, player):
#			 player_last_pos[index] = player.worldPosition.copy()
	
	ScanEvents()
	
	if false:#ObjEventIsInvalid(owner):
		result_node.ExitTree(owner)
		return
	
	#ApplySuspicion(own)
	
#	if head_track:
#		if 'Actor' in event.object:
#			HeadTrack(own, event.object.collision_chest)
#		else:
#			HeadTrack(own, event.object)
	
	result_node.Execute(owner)
	conflict.Execute(owner)


func _process(delta):
	
	pass#ExecuteEvent(object)
