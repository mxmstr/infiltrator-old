extends Node

var Movement_Preset = preload("Actor.Movement.Preset.gd")

var stance = null
var preset = null


func _ready():
	
	stance = 'Walk'
	preset = Movement_Preset.new('Default')
	
	
func ChangePreset(_preset):
	
	preset = Movement_Preset.new(_preset)
	
	
func ChangeStance(_stance):
	
	if preset.can_change_stance and stance != _stance:#and not StandBlocked(own):
		
		stance = _stance
		Move(owner, Vector3(0, 0, 0), false)
		#SetTimer(owner, 'Stance', 5.0)
		
		
func Lean():
	
	pass
	#SetTimer(own, 'Move', 0.5)
	#preset.call(preset.lean_direction, owner)
	
	
func CollisionParent():
	
	preset.CollisionParent(owner)
	
	
func Move(direction, local, avoid=false):
	
	#SetTimer(own, 'Move', 0.5)
	preset.call(stance, owner, direction, local, avoid)
	
	
func Rotate(orientation):
	
	preset.Rotate(owner, orientation)
	
	
func InputRotation(vec_offset):
	
	preset.call(preset.input_rotation, owner, vec_offset)
	
	
func _process(delta):
	
	Lean()
	#CollisionParent()
	
	