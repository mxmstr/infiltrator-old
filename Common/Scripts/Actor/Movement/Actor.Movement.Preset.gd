var Movement_Presets = preload("Actor.Movement.Presets.gd").new().Movement_Presets

var preset = null
var crouch_dist = 0.0

var can_change_stance = null
var enable_rotation = null
var input_rotation = null
var lean_direction = null
var walk = null
var run = null
var crouch = null
var prone = null


func _init(_preset):
	
	preset = _preset
	
	var attributes = Movement_Presets[_preset]
	for attribute in attributes:
		set(attribute, attributes[attribute])
	
	
func LeanRight(actor):
	
	actor.top_offset.x = 0.6
	actor.top_offset.z = actor.top_default_pos.z - 0.5
	
	actor.camera.offset_rot.y = -0.5
	
	
func LeanLeft(actor):
	
	actor.top_offset.x = -0.6
	actor.top_offset.z = actor.top_default_pos.z - 0.5
	
	actor.camera.offset_rot.y = 0.5
	
	
func LeanReset(actor):
	
	actor.top_offset.x = 0.0
	actor.top_offset.z = actor.top_default_pos.z
	
	actor.camera.offset_rot.y = 0.0
	
	
func CollisionParent(actor):
	
	pass
#    new_pos = actor.worldPosition + actor.getAxisVect(
#        actor.top_offset + Vector3(0, 0, crouch_dist)
#        )
#
#    #actor.collision_top.removeParent()
#    actor.collision_top.worldPosition = actor.collision_top.worldPosition.lerp(
#        new_pos, 
#        actor.stance_change_speed# * (60 / logic.getAverageFrameRate())
#        )
#    #child.setParent(parent, True, False)
    
    
func Walk(actor, direction, local, avoid):
	
	crouch_dist = 0.0
	Move(actor, direction, local, walk, avoid)
	
	
func Run(actor, direction, local, avoid):
	
	crouch_dist = 0.0
	Move(actor, direction, local, run, avoid)
	
	
func Crouch(actor, direction, local, avoid):
	
	crouch_dist = -0.6
	Move(actor, direction, local, crouch, avoid)
	
	
func Prone(actor, direction, local, avoid):
	
	crouch_dist = -0.6
	Move(actor, direction, local, prone, avoid)
	
	
func Climb(actor, direction):
	
	pass
#    hit_normal1 = actor.rayCast(
#        actor.worldPosition + Vector3(0.0, 0.0, -0.3), 
#        None, 
#        0, 
#        'Ground', 
#        1, 
#        1
#        )
#
#    dist = 1.0
#
#    hit_normal2 = actor.rayCast(
#        actor.worldPosition + actor.getAxisVect(Vector((direction[0] * dist, direction[1] * dist, -0.18))), 
#        actor.worldPosition + Vector((0.0, 0.0, -0.18)), 
#        0, 
#        'Ground',
#        1, 
#        1
#        )
#
#    if hit_normal2[1] is not None:
#        actor.applyForce([0, 0, (actor.base_speed * 2.0) * abs(direction[0])], False)
#        actor.applyForce([0, 0, (actor.base_speed * 2.0) * abs(direction[1])], False)
    
    
func Move(actor, direction, local, move_mult, avoid):
	
	pass
	#if actor.sensors['Collision_Ground'].positive:
	
#	if avoid:
#		AvoidObstacle(actor)
#
#	direction.normalize()
#	direction.length = actor.base_speed * move_mult# * (60 / logic.getAverageFrameRate())
#	actor.applyForce(direction, local)
#
#	Climb(actor, direction)
	
	
func Rotate(actor, orientation):
	
	pass
#	if enable_rotation:
#		actor.worldOrientation = orientation
		
		
func InputRotationDefault(actor, vec_offset):
	
	pass
#	if enable_rotation:
#		CursorLook(actor, vec_offset, false)
		
		
func InputRotationCam(actor, vec_offset):  
	
	pass
#	if enable_rotation:
#		CursorLook(actor, vec_offset, false)
		
		
func CursorLook(actor, vec_offset, cam_only):
	
	pass
#	actor.screen_position += vec_offset * actor.cursor_sensitivity
#
#	actor.screen_position.x = min(actor.screen_position.x, 1.0)
#	actor.screen_position.x = max(actor.screen_position.x, 0.0)
#	actor.screen_position.y = min(actor.screen_position.y, 1.0)
#	actor.screen_position.y = max(actor.screen_position.y, 0.0)
#
#	cursor_pos = MouseOverAny(actor.camera_ui, actor.screen_position, 'Wall')[1]
#	if cursor_pos != None:
#		actor.crosshair.worldPosition = [cursor_pos[0], cursor_pos[1], 0]
#
#	cam_axis = actor.camera.getAxisVect(Vector((0, 0, -1)))
#	target_axis = actor.camera.getVectTo(actor.track_target)[1]
#
#	cam_offset = Vector((0, 0))
#	cam_offset.x = cam_axis.angle(Vector((target_axis.x, target_axis.y, cam_axis.z)))
#	cam_offset.x *= actor.cursor_reset_speed
#	cam_offset.y = Vector((0, 1, cam_axis.z)).angle(Vector((0, 1, target_axis.z)))
#	cam_offset.y *= actor.cursor_reset_speed
#
#	if actor.screen_position.x > 0.5:
#		cam_offset.x *= -1
#	if actor.screen_position.y > 0.5:
#		cam_offset.y *= -1
#
#	if not cam_only:
#		actor.applyRotation([0, 0, cam_offset.x], True)
#	actor.camera.InputRotation(cam_offset)
#
#	actor.screen_position = actor.screen_position.lerp(Vector((0.5, 0.5)), actor.cursor_reset_speed * 1.0)
#
#	render.setMousePosition(*actor.screen_center)
	
	