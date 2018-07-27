from bge import logic, constraints
from mathutils import Vector
from math import radians
from .Physics import *


def CreateRagdoll(own):

    #pelvis = own.scene.addObject('Ragdoll_Pelvis', own.armature, 0)
    arm_ragdoll = own.armature#pelvis.children['RagdollArmature']

    #arm_ragdoll[pelvis.name] = pelvis

    for child in arm_ragdoll.children:
        if 'RagdollPos_' in child.name:
            arm_ragdoll[child.children[0].name] = child.children[0]
            child.children[0].removeParent()
        
    for bone_name in arm_ragdoll.getPropertyNames():   
        if 'Ragdoll_' in bone_name:
            arm_ragdoll[bone_name].restoreDynamics()
            ##arm_ragdoll[bone_name].enableRigidBody()
            
            if not bone_name == 'Ragdoll_Pelvis':
                arm_ragdoll[bone_name]['Root'] = arm_ragdoll['Ragdoll_Pelvis']
                
                if bone_name in ['Ragdoll_Spine', 'Ragdoll_Thigh_R', 'Ragdoll_Thigh_L']:
                    target = arm_ragdoll['Ragdoll_Pelvis']
                else:    
                    target = arm_ragdoll['Ragdoll_' + Targets(bone_name.split('Ragdoll_')[1])]
                
                #Constrain(
                #    bone_name.split('Ragdoll_')[1], 
                #    arm_ragdoll[bone_name], 
                #    target,
                #    True
                #)
                ConstrainToPose(arm_ragdoll, bone_name.split('Ragdoll_')[1], target)
            
            arm_ragdoll[bone_name].mass = Weights(bone_name.split('Ragdoll_')[1])
            

def ConstrainToPose(armature, bone_name, target):
            
    #visMat = (armature.children['RagdollPos_' + Targets(bone_name)].worldOrientation.to_quaternion().rotation_difference(
    #    armature.children['RagdollPos_' + bone_name].worldOrientation.to_quaternion())).to_matrix()
    visMat = (armature['Ragdoll_' + bone_name].worldOrientation.to_quaternion().rotation_difference(
        armature['Ragdoll_' + Targets(bone_name)].worldOrientation.to_quaternion())).to_matrix()
    vecx1 = visMat[0].copy()
    vecy1 = visMat[1].copy()
    vecz1 = visMat[2].copy()
    
    rot = Vector((0, 0, 0))
    rot[0] = Vector((-vecx1[1], vecx1[0], 0)).angle(vecy1)
    if -vecy1[2] < 0: rot[0] *= -1
    rot[1] = Vector((vecx1[0], vecx1[1], 0)).angle(vecx1)
    if vecx1[2] < 0: rot[1] *= -1
    rot[2] = Vector((0, 1, 0)).angle(Vector((-vecx1[1], vecx1[0], 0)))
    if -vecx1[1] < 0: rot[2] *= -1
    
    Constrain(
        bone_name, 
        armature['Ragdoll_' + bone_name], 
        target,
        True,
        radians(rot[0]),
        radians(rot[1]),
        radians(rot[2])
    )
    
    #c = armature['Ragdoll_' + bone_name]['Constraint']
    
    #c.setParam(3, radians(rot[0]), radians(rot[0]))#c.getParam(3) + radians(rot[0]), c.getParam(3) + radians(rot[0]))
    #c.setParam(4, radians(rot[1]), radians(rot[1]))#c.getParam(4) + radians(rot[1]), c.getParam(4) + radians(rot[1]))
    #c.setParam(5, radians(rot[2]), radians(rot[2]))#c.getParam(5) + radians(rot[2]), c.getParam(5) + radians(rot[2]))