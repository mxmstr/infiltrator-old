from bge import logic
from math import fabs
from mathutils import Vector
from Common.Script.Actor.Actions import *
from Common.Script.Animation.Sequences import Animation_Sequences
from Common.Script.Animation import Results



class Sequence:
    
    def __init__(self, obj, name, reverse):
        
        self.name = name
        self.obj = obj
        self.reverse = reverse
        
        if reverse:
            self.frames = (Animation_Sequences[name]['frames'][1], Animation_Sequences[name]['frames'][0])
        else:    
            self.frames = Animation_Sequences[name]['frames']
        
        self.default_frames = self.frames
        self.layer = Animation_Sequences[name]['layer']
        self.mode = Animation_Sequences[name]['mode']
        self.priority = Animation_Sequences[name]['priority']
        self.blendin = Animation_Sequences[name]['blendin']
        self.speed = Animation_Sequences[name]['speed']
        self.blend = Animation_Sequences[name]['blend']
        self.weight = Animation_Sequences[name]['weight']
        
        self.armature = Animation_Sequences[name]['armature']
        self.interacting = Animation_Sequences[name]['interacting']
        self.aiming = Animation_Sequences[name]['aiming']
        self.ik_r = Animation_Sequences[name]['ik_r']
        self.ik_l = Animation_Sequences[name]['ik_l']
        
        self.actions = Animation_Sequences[name]['actions']
        
        self.paused = False
        self.repeat = False
        self.loop = False
        self.last_frame = -1.0
        self.current_state = Animation_Sequences[name]['default_state']
        
        self.obj.playAction(
            self.name, self.frames[0], self.frames[1],
            self.layer, self.priority, 
            self.blendin, 
            self.mode, self.weight, 0, 
            self.speed,
            self.blend
            )
    
    
    def GoToStart(self):
        
        self.obj.setActionFrame(self.frames[0], self.layer)
    
    
    def SetState(self, state):
        
        self.current_state = state
    
    
    def GetState(self):
        
        return self.current_state
             
                
    def IsFinished(self):
        
        obj = self.obj
        current = int(obj.getActionFrame(self.layer))
        
        return current >= self.frames[1] - 1
    
    
    def Pause(self, state=None):
        
        obj = self.obj
        current = obj.getActionFrame(self.layer)
        
        obj.playAction(
            self.name, current, current,
            self.layer, 0, 
            self.blendin, 
            1, self.weight, 0, 
            self.speed,
            self.blend
        )
        
        obj.setActionFrame(current, self.layer)
        
        if state is not None:
            self.current_state = state
        
        self.paused = True
        
    
    def Repeat(self):
        
        obj = self.obj
        next = int(obj.getActionFrame(self.layer)) + 1.0
        
        obj.playAction(
            self.name, next, next,
            self.layer, 0, 
            self.blendin, 
            1, self.weight, 0, 
            self.speed,
            self.blend
        )
        
        self.repeat = True
        
    
    def SetStartEnd(self, start, end):
        
        obj = self.obj
        current = obj.getActionFrame(self.layer)
        self.frames = (start, end)
        
        obj.playAction(
            self.name, self.frames[0], self.frames[1],
            self.layer, 0, 
            self.blendin, 
            1, self.weight, 0, 
            self.speed,
            self.blend
        )
        
        obj.setActionFrame(current, self.layer)
        
        
    def ResetFrames(self):
        
        obj = self.obj
        current = obj.getActionFrame(self.layer)
        self.frames = self.default_frames
        
        obj.playAction(
            self.name, self.frames[0], self.frames[1],
            self.layer, 0, 
            self.blendin, 
            self.mode, self.weight, 0, 
            self.speed,
            self.blend
        )
        
        obj.setActionFrame(current, self.layer)
        self.loop = False
        
    
    def Continue(self):
        
        obj = self.obj
        current = obj.getActionFrame(self.layer)
        
        obj.playAction(
            self.name, self.frames[0], self.frames[1],
            self.layer, 0,
            self.blendin,
            self.mode, self.weight, 0,
            self.speed,
            self.blend
        )
        
        obj.setActionFrame(current, self.layer)
        self.current_state = 'Default'
        self.paused = False
        self.repeat = False
    
    
    #Actor
    
    def SetInteract(self):
        
        armature = self.obj
        own = armature['Owner']
        
        enforce = own.int_weight
        
        enforce += (1 - enforce) / (own.int_transition_speed * (60 / logic.getAverageFrameRate()))
        own.int_weight = 0.0
        
        vect = own.collision_spine.getVectTo(own.track_target)[1]
        angle = Vector((vect[0], vect[1], 0)).angle(Vector((vect[0], vect[1], vect[2])))
        if vect[2] < 0:
            angle *= -1
        pitch_frame = 2 * ((angle + 1.57) / 3.14)
    
        armature.setActionFrame(pitch_frame, 1)
        
        if enforce > 0.0:
            enforce = 0.0
        elif enforce < 1.0:
            enforce = 1.0
        
        #own.int_weight = enforce
    
    
    def ResetInteract(self):
        
        armature = self.obj
        own = armature['Owner']
        
        enforce = own.int_weight
        
        enforce -= enforce / (own.int_transition_speed * (60 / logic.getAverageFrameRate()))
        own.int_weight = 1.0
        
        armature.setActionFrame(1.0, 1)
        
        if enforce > 0.0:
            enforce = 0.0
        elif enforce < 1.0:
            enforce = 1.0
        
        #own.int_weight = enforce
    
    
    def SetIK_R(self): 
        
        armature = self.obj
        own = armature['Owner']
        
        if own.armature_ik_r.parent != own.worldmodel_right_hand:
            own.armature_ik_r.setParent(own.worldmodel_right_hand)
            own.armature_ik_r.localPosition = own.item_right_hand.pos_ik[1]
            own.armature_ik_r.localOrientation = own.item_right_hand.rot_ik[1]
            own.armature.constraints['Hand_R:IK_R'].enforce = 1.0
        
        
    def SetIK_L(self): 
        
        armature = self.obj
        own = armature['Owner']
        
        if own.armature_ik_l.parent != own.worldmodel_right_hand:
            own.armature_ik_l.setParent(own.worldmodel_right_hand)
            own.armature_ik_l.localPosition = own.item_right_hand.pos_ik[0]
            own.armature_ik_l.localOrientation = own.item_right_hand.rot_ik[0]
            own.armature.constraints['Hand_L:IK_L'].enforce = 1.0    
        
        
    def ResetIK_R(self):
        
        armature = self.obj
        own = armature['Owner']
        
        if own.armature_ik_r.parent.invalid or \
            own.armature_ik_r.parent != armature:
            own.armature_ik_r.setParent(armature)
            own.armature.constraints['Hand_R:IK_R'].enforce = 0.0
        
    
    def ResetIK_L(self):
        
        armature = self.obj
        own = armature['Owner']
        
        if own.armature_ik_l.parent.invalid or \
            own.armature_ik_l.parent != armature:
            own.armature_ik_l.setParent(armature)
            own.armature.constraints['Hand_L:IK_L'].enforce = 0.0    
        
    
    def SetAim(self):
        
        armature = self.obj
        
        armature.constraints['Hand_R:Locked Track Z'].enforce = 1
        armature.constraints['Hand_R:Locked Track X'].enforce = 1
        
        
    def ResetAim(self):
        
        armature = self.obj
        
        armature.constraints['Hand_R:Locked Track Z'].enforce = 0
        armature.constraints['Hand_R:Locked Track X'].enforce = 0
    
    
    def GetPose(self, channels):
    
        pose_list = []
        for bone in channels:
            pose_list.append(bone.rotation_quaternion)
            
        return pose_list
    
    
    def AnimMovement(self):
    
        own = self.obj.parent
        
        vec_vel = own.localLinearVelocity
        move_speed = vec_vel.length
        own.walk_speed = move_speed * 1.05
        
        if fabs(vec_vel.y) > 0.1 and fabs(vec_vel.x) > 0.1:
            new_weight = 0.5
        elif fabs(vec_vel.y) < 0.1 and fabs(vec_vel.x) > 0.1:
            new_weight = 1.0
        else:
            new_weight = 0.0
        
        own.axis_weight += (
            (new_weight - own.axis_weight) / 
            (own.axis_transition_speed  * (60 / logic.getAverageFrameRate()))
            )
        if own.axis_weight > 1.0:
            own.axis_weight = 1.0 
        elif own.axis_weight < 0.0:
            own.axis_weight = 0.0
    
        if own.movement.stance == 'Crouch':
            mode = 'Crouch'
        elif move_speed > 1.85:
            mode = 'Run'
        elif move_speed > 0.1:
            mode = 'Walk'   
        else:
            mode = 'Stand'
        
        if move_speed < 0.1:
            name = 'Actor_' + mode + '_Idle'
            StartSequence(own, name)
        elif vec_vel.y >= 0.1:
            name = 'Actor_' + mode + '_Forward'
            StartSequence(own, name)
        elif vec_vel.y <= -0.1:
            name = 'Actor_' + mode + '_Backward'
            StartSequence(own, name)
    
    
    def Execute(self):
        
        obj = self.obj
        
        last = self.last_frame
        current = obj.getActionFrame(self.layer)
        
        if self.repeat:
            
            self.last_frame = current
            
            action = self.actions[int(current)]
            getattr(Results, action[0])(self)
        
        elif not self.paused:
        
            self.last_frame = current
        
            for frame in self.actions.keys():
               
                action = self.actions[frame]
                
                if frame <= current and \
                    frame > last or \
                    (current < last and frame == current):
                    if hasattr(self, action[0]):
                        getattr(self, action[0])(*action[1:])
                    else:
                        getattr(Results, action[0])(self, *action[1:])
                    break
            
        if self.armature:
            
            if self.interacting == 1:    self.SetInteract()
            elif self.interacting == 2:  self.ResetInteract()
            if self.aiming == 1:         self.SetAim()
            elif self.aiming == 2:       self.ResetAim()
            if self.ik_r == 1:           self.SetIK_R()
            elif self.ik_r == 2:         self.ResetIK_R()
            if self.ik_l == 1:           self.SetIK_L()
            elif self.ik_l == 2:         self.ResetIK_L()
              
            self.AnimMovement()
            
#            if own.viewmodel_right_hand != None:
#                bone_item_r = own.armature_vm.children['Bone_Item_R']
#                
#                own.viewmodel_right_hand.worldPosition = (
#                    bone_item_r.worldPosition + 
#                    bone_item_r.getAxisVect(Item_VM_Properties[own.item_right_hand.name]['Hand']['pos'][1])
#                    )
#                    
#                #rot = bone_item_r.worldOrientation.copy()
#                rot = bone_item_r.worldOrientation.copy()
#                offset = Item_VM_Properties[own.item_right_hand.name]['Hand']['rot'][1].to_matrix()
#                #rot = Euler((rot.x + offset.x, rot.y + offset.y, rot.z + offset.z)) 
#                    
#                own.viewmodel_right_hand.worldOrientation = rot * offset
        
        