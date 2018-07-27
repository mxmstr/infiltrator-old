#from Common.Script.Globals import *
#from Common.Script.Animation.Sequence import Sequence
#from Common.Script.Actor.Actions import *
#from Common.Script.Item.Item import Item
#from Common.Script.Item.Inventories import Inventory_Presets
#from Common.Script.Interaction.Interactive import Interactive
#from Common.Script.Actor.Movement.Stance import Movement_Stance

extends Node

var Globals = preload("res://Common/Scripts/Globals.gd").new()

export var base_speed_multiplier = 1.0
export var stance_change_speed = 0.1
export var walk_speed = 1.0

# Movement
var speed = null
var speed_multiplier = 1.0
var target_pos = Vector3(0, 0, 0)
var throw_power = 0.0
var axis_weight = 0.0
var y_weight = 0.0
var x_weight = 0.0
var axis_transition_speed = 10.0
var int_weight = 0.0
var int_transition_speed = 10.0
var ik_transition_speed = 0.05

# UI
var inventory_open = false
var interaction_menu_open = false
var dialogue_menu_open = false

# Armature
var bone_list = ['Head', 'Neck', 'Chest', 'Spine', 'Pelvis', 'Shoulder_R', 'Shoulder_L', 'UpArm_R', 'UpArm_L', 'LoArm_R', 'LoArm_L', 'Hand_R', 'Hand_L', 'Thigh_R', 'Thigh_L', 'Knee_R', 'Knee_L', 'Foot_R', 'Foot_L']
var bones_upper = ['Head', 'Neck', 'Chest', 'Spine', 'Pelvis', 'Shoulder_R', 'Shoulder_L', 'UpArm_R', 'UpArm_L', 'LoArm_R', 'LoArm_L', 'Hand_R', 'Hand_L']
var bones_interactive = ['Head', 'Neck', 'Chest', 'Spine']

# Items
var inventory = []


func _init():

    speed = Globals.Base_Speed * speed_multiplier

    # Armature

#    self.armature = self.children['ActorArmature']
#    self.armature['Owner'] = self
#    self.armature_ik_r = self.armature.children['ActorArmature_IK_R']
#    self.armature_ik_l = self.armature.children['ActorArmature_IK_L']
#    self.wrist_r = self.armature.children['Actor_Wrist_R']
#    self.wrist_l = self.armature.children['Actor_Wrist_L']
#    self.holster_r = self.armature.children['Actor_Holster_R']
#    self.holster_l = self.armature.children['Actor_Holster_L']
#
#    self.constraint_head = self.armature.constraints['Head:Track To']
#    self.constraint_ik_r = self.armature.constraints['Hand_R:IK_R']
#    self.constraint_ik_l = self.armature.constraints['Hand_L:IK_L']
#
#    self.armature_vm = Globals.Scene_VM.objects['ActorArmatureVM']
#    self.armature_vm_ik_r = self.armature_vm.children['ActorArmatureVM_IK_R']
#    self.armature_vm_ik_l = self.armature_vm.children['ActorArmatureVM_IK_L']
#    self.armature_vm_defaultpos = self.armature_vm.worldPosition.copy()
#
#    self.head_track = False
#    self.track_target = self.children['ActorTrackTarget']
#    self.track_target_vm = Globals.Scene_VM.objects['ActorTrackTargetVM']
#
#    self.sequences = [None, None, None, None]
#
#    self.StartSequence('Actor_Pitch', False, False)
#    #self.StartSequence('Actor_Walk_Right', False)
#    self.StartSequence('Actor_Walk_Forward', False, False)
#    self.StartSequence('Actor_Default_Interaction', False, False)
#
#    # Collision
#    self.collision_top = self.children['ActorCollision_top']
#    self.top_default_pos = self.collision_top.localPosition.copy()
#    self.top_offset = self.top_default_pos.copy()
#
#    self.collision_head = self.armature.children['Collision_Head']
#    self.collision_neck = self.armature.children['Collision_Neck']
#    self.collision_chest = self.armature.children['Collision_Chest']
#    self.collision_spine = self.armature.children['Collision_Spine']
#    self.collision_pelvis = self.armature.children['Collision_Pelvis']
#    self.collision_shoulder_r = self.armature.children['Collision_Shoulder_R']
#    self.collision_shoulder_l = self.armature.children['Collision_Shoulder_L']
#    self.collision_uparm_r = self.armature.children['Collision_UpArm_R']
#    self.collision_uparm_l = self.armature.children['Collision_UpArm_L']
#    self.collision_loarm_r = self.armature.children['Collision_LoArm_R']
#    self.collision_loarm_l = self.armature.children['Collision_LoArm_L']
#    self.collision_hand_r = self.armature.children['Collision_Hand_R']
#    self.collision_hand_l = self.armature.children['Collision_Hand_L']
#    self.collision_thigh_r = self.armature.children['Collision_Thigh_R']
#    self.collision_thigh_l = self.armature.children['Collision_Thigh_L']
#    self.collision_knee_r = self.armature.children['Collision_Knee_R']
#    self.collision_knee_l = self.armature.children['Collision_Knee_L']
#    self.collision_foot_r = self.armature.children['Collision_Foot_R']
#    self.collision_foot_l = self.armature.children['Collision_Foot_L']

    # Input
    #movement = Movement_Stance.new()

#    self.sen_mouse = EventManager.sensors['Mouse']
#    self.screen_center = (render.getWindowWidth()//2, render.getWindowHeight()//2)
#    self.screen_position = Vector((0.5, 0.5))
#    self.crosshair = Globals.Scene_UI.objects['UI_Crosshair']
#    self.mouselook_sensitivity = -0.005
#    self.cursor_sensitivity = 0.005
#    self.cursor_reset_speed = 0.1
#
#    render.setMousePosition(*self.screen_center)
#    render.showMouse(False)
#
#    self.pip_cam = None

    # Items

#    for item_name in Inventory_Presets[self['Inventory_Preset']]:
#        self.inventory.append(Item(item_name))
#
#    for item in self.inventory:
#        if item.holster != null:
#            CreateHolsterWM(self, getattr(self, item.holster), item)
#
#    self.equip_icon = None
#    self.item_left_hand = None
#    self.item_right_hand = Item('Unarmed')
#    self.item_display_order = ['Pistol', 'Baton', 'Can', 'Body', 'Unarmed']
#
#    self.worldmodel_left_hand = None
#    self.worldmodel_right_hand = None
#    self.viewmodel_left_hand = None
#    self.viewmodel_right_hand = None
#
#    # Camera
#    self.camera = self.childrenRecursive['Camera_Controller']
#
#    #self.camera.children[0].frustum_culling = True
#    self.camera_vm = Globals.Scene_VM.objects['Camera_ViewModel']
#    #self.camera_vm.frustum_culling = False
#    self.camera_ui = Globals.Scene_UI.objects['Camera_UI']
#    self.camera_fake = Globals.Scene_Main.objects['Camera_Fake']
#    self.camera_fakevm = Globals.Scene_VM.objects['Camera_FakeVM']
#
#    #self.camera_fake.useViewport = False
#    #self.camera_fakevm.useViewport = False
#
#    # Interaction
#    self.interaction_preset = 'Actor_Default'
#    self.interaction_default = 'Default'
#    self.interaction = None
#
#    self.interaction_sensor = EventManager.InitializeObj(
#        self.childrenRecursive['Actor_InteractionSensor'], Interactive)


#class Actor(types.KX_GameObject):
#
#    def __init__(self, own):
#
#        # Timer
#        self.timers = []
#        self.timers.append(Timer('Stance', 0.0, True))
#        self.timers.append(Timer('Move', 0.0, True))
#        self.timers.append(Timer('Action', 0.0, True))
#        self.timers.append(Timer('Item', 0.0, True))
#        self.timers.append(Timer('Prone', 0.0, True))
#        self.timers.append(Timer('PIP', 0.0, True))
#        self.timers.append(Timer('Idle', 200.0, True))
#        self.timers.append(Timer('RouteStop', 0.0, True))
#
#        # Attributes
#        self.health = 100.0
#        self.stun = 0.0
#
#        self.base_speed = Base_Speed
#        self.stance_change_speed = 0.1
#
#        self.target_pos = Vector((0.0, 0.0, 0.0))
#        self.throw_power = 0.0
#
#        self.walk_speed = 1.0
#        self.axis_weight = 0.0
#        self.y_weight = 0.0
#        self.x_weight = 0.0
#        self.axis_transition_speed = 10.0
#        self.int_weight = 0.0
#        self.int_transition_speed = 10.0
#        self.ik_transition_speed = 0.05
#
#        # Armature
#
#        self.bone_list = ('Head', 'Neck', 'Chest', 'Spine', 'Pelvis', 'Shoulder_R', 'Shoulder_L', 'UpArm_R', 'UpArm_L', 'LoArm_R', 'LoArm_L', 'Hand_R', 'Hand_L', 'Thigh_R', 'Thigh_L', 'Knee_R', 'Knee_L', 'Foot_R', 'Foot_L')
#        self.bones_upper = ('Head', 'Neck', 'Chest', 'Spine', 'Pelvis', 'Shoulder_R', 'Shoulder_L', 'UpArm_R', 'UpArm_L', 'LoArm_R', 'LoArm_L', 'Hand_R', 'Hand_L')
#        self.bones_interactive = ('Head', 'Neck', 'Chest', 'Spine')
#
#        self.armature = self.children['ActorArmature']
#        self.armature['Owner'] = self
#        self.armature_ik_r = self.armature.children['ActorArmature_IK_R']
#        self.armature_ik_l = self.armature.children['ActorArmature_IK_L']
#        self.wrist_r = self.armature.children['Actor_Wrist_R']
#        self.wrist_l = self.armature.children['Actor_Wrist_L']
#        self.holster_r = self.armature.children['Actor_Holster_R']
#        self.holster_l = self.armature.children['Actor_Holster_L']
#
#        self.constraint_head = self.armature.constraints['Head:Track To']
#        self.constraint_ik_r = self.armature.constraints['Hand_R:IK_R']
#        self.constraint_ik_l = self.armature.constraints['Hand_L:IK_L']
#
#        self.armature_vm = Globals.Scene_VM.objects['ActorArmatureVM']
#        self.armature_vm_ik_r = self.armature_vm.children['ActorArmatureVM_IK_R']
#        self.armature_vm_ik_l = self.armature_vm.children['ActorArmatureVM_IK_L']
#        self.armature_vm_defaultpos = self.armature_vm.worldPosition.copy()
#
#        self.head_track = False
#        self.track_target = self.children['ActorTrackTarget']
#        self.track_target_vm = Globals.Scene_VM.objects['ActorTrackTargetVM']
#
#        self.sequences = [None, None, None, None]
#
#        self.StartSequence('Actor_Pitch', False, False)
#        #self.StartSequence('Actor_Walk_Right', False)
#        self.StartSequence('Actor_Walk_Forward', False, False)
#        self.StartSequence('Actor_Default_Interaction', False, False)
#
#        # Collision
#        self.collision_top = self.children['ActorCollision_top']
#        self.top_default_pos = self.collision_top.localPosition.copy()
#        self.top_offset = self.top_default_pos.copy()
#
#        self.collision_head = self.armature.children['Collision_Head']
#        self.collision_neck = self.armature.children['Collision_Neck']
#        self.collision_chest = self.armature.children['Collision_Chest']
#        self.collision_spine = self.armature.children['Collision_Spine']
#        self.collision_pelvis = self.armature.children['Collision_Pelvis']
#        self.collision_shoulder_r = self.armature.children['Collision_Shoulder_R']
#        self.collision_shoulder_l = self.armature.children['Collision_Shoulder_L']
#        self.collision_uparm_r = self.armature.children['Collision_UpArm_R']
#        self.collision_uparm_l = self.armature.children['Collision_UpArm_L']
#        self.collision_loarm_r = self.armature.children['Collision_LoArm_R']
#        self.collision_loarm_l = self.armature.children['Collision_LoArm_L']
#        self.collision_hand_r = self.armature.children['Collision_Hand_R']
#        self.collision_hand_l = self.armature.children['Collision_Hand_L']
#        self.collision_thigh_r = self.armature.children['Collision_Thigh_R']
#        self.collision_thigh_l = self.armature.children['Collision_Thigh_L']
#        self.collision_knee_r = self.armature.children['Collision_Knee_R']
#        self.collision_knee_l = self.armature.children['Collision_Knee_L']
#        self.collision_foot_r = self.armature.children['Collision_Foot_R']
#        self.collision_foot_l = self.armature.children['Collision_Foot_L']
#
#        # Input
#        self.movement = Movement_Stance()
#
#        self.sen_mouse = EventManager.sensors['Mouse']
#        self.screen_center = (render.getWindowWidth()//2, render.getWindowHeight()//2)
#        self.screen_position = Vector((0.5, 0.5))
#        self.crosshair = Globals.Scene_UI.objects['UI_Crosshair']
#        self.mouselook_sensitivity = -0.005
#        self.cursor_sensitivity = 0.005
#        self.cursor_reset_speed = 0.1
#
#        render.setMousePosition(*self.screen_center)
#        render.showMouse(False)
#
#        self.pip_cam = None
#
#        # UI
#        self.inventory_open = False
#        self.interaction_menu_open = False
#        self.dialogue_menu_open = False
#
#        # Items
#        self.inventory = []
#
#        for item_name in Inventory_Presets[self['Inventory_Preset']]:
#            self.inventory.append(Item(item_name))
#
#        for item in self.inventory:
#            if item.holster is not None:
#                CreateHolsterWM(self, getattr(self, item.holster), item)
#
#        self.equip_icon = None
#        self.item_left_hand = None
#        self.item_right_hand = Item('Unarmed')
#        self.item_display_order = ['Pistol', 'Baton', 'Can', 'Body', 'Unarmed']
#
#        self.worldmodel_left_hand = None
#        self.worldmodel_right_hand = None
#        self.viewmodel_left_hand = None
#        self.viewmodel_right_hand = None
#
#        # Camera
#        self.camera = self.childrenRecursive['Camera_Controller']
#
#        #self.camera.children[0].frustum_culling = True
#        self.camera_vm = Globals.Scene_VM.objects['Camera_ViewModel']
#        #self.camera_vm.frustum_culling = False
#        self.camera_ui = Globals.Scene_UI.objects['Camera_UI']
#        self.camera_fake = Globals.Scene_Main.objects['Camera_Fake']
#        self.camera_fakevm = Globals.Scene_VM.objects['Camera_FakeVM']
#
#        #self.camera_fake.useViewport = False
#        #self.camera_fakevm.useViewport = False
#
#        # Interaction
#        self.interaction_preset = 'Actor_Default'
#        self.interaction_default = 'Default'
#        self.interaction = None
#
#        self.interaction_sensor = EventManager.InitializeObj(
#            self.childrenRecursive['Actor_InteractionSensor'], Interactive)
#
#
#    def StartSequence(self, name, reverse, overwrite):
#
#        if overwrite or not SequenceExists(self.armature, name):
#            sequence = Sequence(self.armature, name, reverse)
#            self.sequences[sequence.layer - 1] = sequence
        
        