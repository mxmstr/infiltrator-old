
var Projectile_Presets = preload("Projectile.Presets.gd").new().Projectile_Presets

export var preset = ''

var shooter = null

var hitscan = null
var lifetime = null
var face_camera = null

var linear_velocity = null
var angular_velocity = null
var rand_linear = null
var rand_angular = null
var d_loc = null
var d_rot = null
var rand_loc = null
var rand_rot = null

var collisions = null


func _ready():
	
	attributes = Projectile_Presets[preset]
	for attribute in attributes:
		set(attribute, attributes[attribute])
	
#	rand_linear = Vector3(rand_linear)
#	for i in range(rand_linear.size()):
#		if i != 0:
#			self.rand_linear[j] = uniform(-i, i)
#
#	rand_angular = Vector3(rand_angular)
#	for i, j in enumerate(self.rand_angular):
#		if j != 0:
#			self.rand_angular[i] = uniform(-j, j)
#
#	self.rand_loc = Vector(self.rand_loc)
#	for i, j in enumerate(self.rand_loc):
#		if j != 0:
#			self.rand_loc[i] = uniform(-j, j)
#
#	self.rand_rot = Vector(self.rand_rot)
#	for i, j in enumerate(self.rand_rot):
#		if j != 0:
#			self.rand_rot[i] = uniform(-j, j)
	
#	self.localLinearVelocity = Vector(self.linear_velocity) + Vector(self.rand_linear)
#	self.localAngularVelocity = Vector(self.angular_velocity) + Vector(self.rand_angular)
#
#	self.d_loc = Vector(self.d_loc) + self.rand_loc
#	self.d_rot = Vector(self.d_rot) + self.rand_rot


func End(obj=null):
	
	pass#self.endObject()
	
	
func DamageActor(obj=null):
	
	pass
#	enemy = obj.parent.parent
#	bone = obj.name.split('Collision_')[1]
#
#	if not enemy == self.shooter:
#		ApplyDamage(self.shooter, enemy, self, bone)
#		self.endObject()
		

func ApplyLaser(obj=null, point=null, normal=null):
	
	pass
#	render.drawLine(self.worldPosition, point, [255, 0, 0])
#
#	spot = logic.getCurrentScene().addObject('Hitscan_Laser_Spot', None, 1)
#	vect = self.getVectTo(point)[1]
#	vect.negate()
#	vect.length = 0.75
#
#	spot.worldPosition = point + vect
#	spot.worldOrientation = vect.to_track_quat('Z', 'Y')#.alignAxisToVect(vect, 1)
#
#	smoke = logic.getCurrentScene().addObject('Smoke_Laser')
#	smoke.worldPosition = point
			

func _process(delta):
		
	if collisions.keys().size() > 0:
		
		if hitscan > 0.0:
			
			hit_objects = []
			
#			for prop in collisions.keys():
#				(obj, point, normal) = self.rayCast(
#					self.worldPosition + self.getAxisVect(Vector((0, 1, 0))), 
#					None, self.hitscan, prop, 1, 1
#					)
#				if obj != None and not obj in self.shooter.childrenRecursive:
#					hit_objects.append((prop, obj, point, normal))
#
#			hit_objects.sort(key = lambda x: (self.getVectTo(x[1])[0]), reverse = False)
#
#			if len(hit_objects) > 0:
#				getattr(
#					self, 
#					self.collisions[hit_objects[0][0]]
#					)(hit_objects[0][1], hit_objects[0][2], hit_objects[0][3])
#				if self.invalid:
#					return
			
		else:	
			
			pass
#			hit_objects = self.sensors['Collision'].hitObjectList   
#
#			for obj in hit_objects:
#				for prop in self.collisions.keys():
#					if prop in obj:
#						getattr(self, self.collisions[prop])(obj)
#						if self.invalid:
#							return
	
	if face_camera:
		
		pass
#		camera = logic.getCurrentScene().active_camera
#		vect = camera.getAxisVect(Vector((0, 0, 1)))
#		self.worldOrientation = vect.to_track_quat('Z', 'Y')
	
#	self.applyMovement(self.d_loc)
#	self.applyRotation(self.d_rot)
#
#	lifetime -= delta
#	if lifetime <= 0.0:
#		self.End(None)
