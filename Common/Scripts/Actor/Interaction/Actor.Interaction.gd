
extends Node

var Interaction_Presets = preload("Actor.Interactions.gd").new().Interaction_Presets

var preset = null
var object = null
var states = null
var subject = null
var state = null
var input_context = null
var movement_preset = null
var enable_events = null
var inherit = null
var params = null
var enter = null
var execute = null
var exit = null


func _ready(_preset, _obj):
	
	preset = _preset
	object = _obj
	states = Interaction_Presets[_preset]['States']
	
	#self.interaction_preset = 'Actor_Default'
#    self.interaction_default = 'Default'
#    self.interaction = None
#
#    self.interaction_sensor = EventManager.InitializeObj(
#        self.childrenRecursive['Actor_InteractionSensor'], Interactive)
	
	
func ChangeState(_subject, _state, _params):
	
	subject = _subject
	state = _state
	var attributes = Interaction_Presets[preset][_state]
	
	input_context = attributes['Input_Context']
	movement_preset = attributes['Movement_Preset']
	enable_events = attributes['Enable_Events']
	inherit = attributes['Inherit_Subj']
	
	if input_context != null and false:#Actions.IsPlayer(object):
		pass#Actions.ChangeAbilityInput(self.object, self.input_context)
		
	if movement_preset != null:
		pass#Actions.ChangeMovementPreset(self.object, self.movement_preset)
	
	if params == null:
		params = attributes['Params']
	else:	
		params = params
	
	enter = attributes['Enter']
	execute = attributes['Execute']
	exit = attributes['Exit']
	
	Enter()
	
	
func CanInteract(_subject, _state):
	
	if not _state in Interaction_Presets[preset]:
		return false
	
	var attributes = Interaction_Presets[preset][_state]
	
	var dist = attributes['Dist']
	var obj_min_angle = attributes['Obj_Min_Angle']
	var obj_max_angle = attributes['Obj_Max_Angle']
	var subj_min_angle = attributes['Subj_Min_Angle']
	var subj_max_angle = attributes['Subj_Max_Angle']
	var must_be_reset = attributes['Must_Be_Reset']
	var triggers = attributes['Triggers']
	
	if triggers != null:
		for trigger in triggers:
			pass
#			if not Actions.call(trigger, object):
#				return false
			
	if _subject == null:
		return true
	
	return false
#	if false:#Actions.IsActor(object):
#		ray_subj = subject.rayCast(object.camera, None, 0, 'Wall', 0, 1)
#		vect_subj = subject.getVectTo(object.camera)
#	else:
#		ray_subj = subject.rayCast(object, None, 0, 'Wall', 0, 1)
#		vect_subj = subject.getVectTo(object)
#
#	vecz_subj = subject.getAxisVect(Vector((0, 1, 0)))
#	vecz_obj = object.getAxisVect(Vector((0, 1, 0)))
#	angle_subj = vect_subj[1].angle(vecz_subj)
#	vect_subj[1].negate()
#	angle_obj = vect_subj[1].angle(vecz_obj)
#
#	return (
#		not must_be_reset and \
#		ray_subj[0] == None and \
#		(dist == 0 or vect_subj[0] < dist) and \
#		angle_subj > subj_min_angle and \
#		angle_obj > obj_min_angle and \
#		angle_subj < subj_max_angle and \
#		angle_obj < obj_max_angle
#		)
	
	
func Enter():
	
	for action in enter:
		
		var _params = [object]
		
		if params != null:
			var indicies = null#action[1:](action[i] for i in range(from, to, step))
			for i in indicies:
				_params.append(params[i])
			
		#Actions(action[0], *_params)
	
	
func Execute():
	
	if enable_events and false:#Actions.IsNPC(self.object):
		pass#Actions.ExecuteEvent(object)
	
	for action in execute:
		
		var _params = [object]
		
		if params != null:
			var indicies = null#action[1:]
			for i in indicies:
				_params.append(params[i])
		
		#getattr(Actions, action[0])(*params)
		
		
func Exit():	
	
	for action in exit:
		
		var _params = [object]
		
		if params != null:
			var indicies = null#action[1:]
			for i in indicies:
				_params.append(params[i])
		
		#getattr(Actions, action[0])(*params)
		
		
func _process(delta):
	
	pass#Execute()
	
	