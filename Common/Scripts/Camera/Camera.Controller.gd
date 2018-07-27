
extends Node

var Camera_Presets = preload("Camera.Presets.gd").new().Camera_Presets

var preset = null
var object = null
var subject = null
var reset_cam = null

var parent = null
var parent_pos = null
var pivot_rot = null
var pivot_pos = null
var default_rot = null
var default_pos = null
var limit_pitch = null
var limit_yaw = null

var offset_rot = Vector3(0, 0, 0)
var offset_pos = Vector3(0, 0, 0)

  
func _ready():
	
	pass#Globals.EventManager.CameraList.append(self)
	

func ChangePreset(_preset, _object, _subject, _reset_cam):
	
	var parent_rot = Vector3(0, 0, 0)#self.worldOrientation.copy()
	var parent_pos = Vector3(0, 0, 0)#self.worldPosition.copy()
	
	preset = _preset
	object = _object
	subject = _subject
	reset_cam = _reset_cam
	
	var attributes = Camera_Presets[_preset]
	for attribute in attributes:
		set(attribute, preset[attribute])
	
	Reset()
	
	if not reset_cam:
		pass#worldOrientation = parent_rot
	
	
func Reset():
	
	if parent:
		pass
#		self.setParent(self.object)
#
#		self.localOrientation = Euler(self.default_rot)
#		self.localPosition = Vector(self.pivot_pos)
		
	elif parent_pos:
		#self.setParent(self.object)
		pass

	else:
		pass#self.removeParent()


func InputRotation(vec_offset):
	
	pass
#	var rot_local = self.localOrientation.to_euler()
#
#	if rot_local.x + vec_offset.y > self.limit_pitch[1] + self.pivot_rot[1]:
#		vec_offset.y = self.limit_pitch[1] + self.pivot_rot[1] - rot_local.x
#	elif rot_local.x + vec_offset.y < self.limit_pitch[0] + self.pivot_rot[1]:
#		vec_offset.y = self.limit_pitch[0] + self.pivot_rot[1] - rot_local.x
#
#	if rot_local.y + vec_offset.x > self.limit_yaw[1] + self.pivot_rot[0]:
#		vec_offset.x = self.limit_yaw[1] + self.pivot_rot[0] - rot_local.y
#	elif rot_local.y + vec_offset.x < self.limit_yaw[0] + self.pivot_rot[0]:
#		vec_offset.x = self.limit_yaw[0] + self.pivot_rot[0] - rot_local.y
#
#	self.localOrientation = Euler((
#		rot_local.x + vec_offset.y, 
#		rot_local.y + vec_offset.x, 
#		rot_local.z))
	
	
func Track():
	
	pass
#	vect_track = self.getVectTo(target)[1]
#	quat_track = vect_track.to_track_quat('-Z', 'Y')
#	self.worldOrientation = quat_track
	
	
func _process(delta):
	
	if subject != null:
		Track()
		
	if parent_pos:
		pass
#		rot_obj = self.object.worldOrientation.to_euler()
#
##			 self.worldOrientation = self.default_rot
##			 self.worldOrientation.rotate(Euler(self.pivot_rot))
#
#		pivot_pos = Vector(self.pivot_pos)
#		pivot_pos.rotate(rot_obj)
#		self.worldPosition = self.object.worldPosition + pivot_pos
			