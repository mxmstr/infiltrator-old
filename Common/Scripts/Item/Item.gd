
extends Node

var Items = preload("Items.gd").new().Items

export var item = ''

var type = null
var rank = null

var right_hand_only = null
var two_handed = null
var can_store = null
var is_stolen = null
var always_ready = null
var rate = null
var reset_time = null

var bone = null
var attack_bones = null
var holster = null
var projectile = null

var anim_primary = null
var anim_throw = null
var anim_reload = null
var anim_blendin = null
var anim_blendin_override = null
var anim_equip = null

var damage_primary = null
var damage_thrown = null
var range_max = null
var range_min = null
var clip = null
var clip_size = null

var pos_hand = null
var rot_hand = null
var pos_holster = null
var rot_holster = null
var pos_ik = null
var rot_ik = null
var dimensions = null

var delta_velocity = 0.0


func _ready():
	
	var attributes = Items[item]
	for attribute in attributes:
		set(attribute, attributes[attribute])
	
	