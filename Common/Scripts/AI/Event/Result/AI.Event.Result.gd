#from bge import logic
#from Common.Script.Utils.Timer import Timer
#from Common.Script.AI.Event.Result import Results
#from Common.Script.Actor import Actions
#from Common.Script import Globals
#from Common.Script.Dialogue.Trees import Dialogue_Trees

#onready var Results = preload("AI.Event.Results.gd").new()

var result = null
var type = null
    
var parent = null
var child = null
var next = null
var exit = null
var timer = null


func init(result_, parent_, type_, exit_):
	
	result = result_
	type = type_
	parent = parent_
	
	if exit_ != null:
		exit = exit_
		
		
func ResetTimer(actor):
	
	if timer != null:
		actor.remove_child(timer)
		timer.queue_free()
		timer = null
	
	if result[1] != -1.0:
		timer = Timer.new()
		actor.add_child(timer)
		timer.wait_time = result[1]
		timer.one_shot = true
		timer.autostart = true
		timer.connect("timeout", self, "OnTimeOut", [actor])
		timer.start()
		
		
func OnTimeOut(actor):
	
	var end = next == null
	
	if child != null:
		ExitToParent(actor, self)
		
	if end:
		ExitBranch(actor, false)
	else:
		NextResultNode(actor, false)
		
	ExitTree(actor)
	
	
func StartEventResult(actor):
	
	if child == null:
		if len(result) > 2:
			ApplyResultAttributes(actor)
	else:
		EnterBranch(actor)
		
		
func ApplyResultAttributes(actor):
	
	pass
#	actor.head_track = self.result[2]
#	if self.result[3] > 0.0:
#		if Actions.EventObjIsPlayer(actor):
#			Actions.ChangePIPCam(actor.event.object, actor.camera, self.result[3])
#		else:
#			for player in Globals.EventManager.PlayerList:
#				Actions.ChangePIPCam(player, actor.camera, self.result[3])
#		if Actions.EventObjIsActor(actor):
#			Actions.ChangeCameraState(actor.camera, 'Subjective_NPC', actor.collision_top, actor.event.object.collision_chest)
#		else:    
#			Actions.ChangeCameraState(actor.camera, 'Subjective_NPC', actor.collision_top, actor.event.object)
#	else:
#		Actions.ChangeCameraState(actor.camera, 'Subjective_NPC', actor.collision_top)
#	Actions.ChangeConflictState(actor, self.result[4])
#	if not self.result[5] == None:
#		text = Dialogue_Trees['Events'][self.result[5]][actor['AI_Preset']]
#		Actions.AppendDialogue(actor, text)


func EvaluateSuccess(actor, success, recursive, end):
	
	pass
	
	
func NextResultNode(actor, recursive):
	
	actor.result_node = next
	actor.result_node.ResetTimer()
	actor.result_node.StartEventResult(actor)
	
	if recursive:
		actor.result_node.Execute(actor)
		
		
func EnterBranch(actor):
    
	actor.result_node = child
	actor.result_var_stack.append(actor.result_var_stack[-1])
	actor.result_node.ResetTimer()
	actor.result_node.StartEventResult(actor)
	
	
func LoopResultNode(actor):
	
	actor.result_node = parent.child
	actor.result_node.ResetTimer()
	actor.result_node.StartEventResult(actor)
	
	
func ExitToParent(actor, parent):
	
	while actor.result_node.parent != parent:
		ExitBranch(actor, true)
		
		ExitBranch(actor, true)
		
		
func ExitBranch(actor, success):
	
	if exit != null:
		pass#Results.call(exit, actor)
	
	if parent == null:
		#Actions.ResetEvent(actor)
		return
		
	actor.result_node = parent
	actor.result_var_stack.pop()
	actor.result_node.Execute(actor, success, false)
	
	
func ExitTree(actor):
	
	while actor.result_node.parent != null:
		
		if actor.result_node.exit != null:
			pass#Results.call(actor.result_node.exit, actor)
			
		actor.result_node = actor.result_node.parent
		
	if actor.result_node.exit != null:
		pass#Results.call(actor.result_node.exit, actor)
		
	pass#Actions.ResetEvent(actor)
	
	
func Execute(actor, success_=null, recursive=false):
	
	var success = null
	
	if success_ is null:
		success = true#Results.call(result[0], actor)
	else:
		success = success_
		
	if success != null:
		EvaluateSuccess(actor, success, recursive)
		
		