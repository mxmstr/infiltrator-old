from bge import logic, events, constraints
from math import radians as r


def Constrain(bone_name, bone, target, create = False, offsetx = 0, offsety = 0, offsetz = 0):
    
    flag = 128
    
    if bone_name == 'Spine':
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, r(-20), r(20))
        bone['Constraint'].setParam(4, r(-20), r(20))
        bone['Constraint'].setParam(5, r(-20), r(20))
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
    elif bone_name == 'Chest':
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, r(-20), r(20))
        bone['Constraint'].setParam(4, r(-20), r(20))
        bone['Constraint'].setParam(5, r(-20), r(20))
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
    elif bone_name == 'Neck':
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, r(-20), r(20))
        bone['Constraint'].setParam(4, r(-25), r(25))
        bone['Constraint'].setParam(5, 0.0, 0.0)
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
    elif bone_name == 'Head':
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, r(-20), r(20))
        bone['Constraint'].setParam(4, r(-10), r(10))
        bone['Constraint'].setParam(5, r(-80), r(80))
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
    elif bone_name in ['Shoulder_R','Shoulder_L']:
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, 0.0, 0.0)
        if bone_name == 'Shoulder_R':
            bone['Constraint'].setParam(4, r(-20), r(20))
            bone['Constraint'].setParam(5, r(-45), r(20))
        else:
            bone['Constraint'].setParam(4, r(-20), r(20))
            bone['Constraint'].setParam(5, r(-20), r(45))
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)  
    elif bone_name in ['UpArm_R','UpArm_L']:
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, r(-45), r(45))
        if bone_name == 'UpArm_R':
            bone['Constraint'].setParam(4, r(-45), r(45))
            bone['Constraint'].setParam(5, r(-45), r(20))
        else:
            bone['Constraint'].setParam(4, r(-45), r(45))
            bone['Constraint'].setParam(5, r(-20), r(45))
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
    elif bone_name in ['LoArm_R','LoArm_L']:
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, 0, 0)#r(-80), r(80))
        if bone_name == 'LoArm_R':
            bone['Constraint'].setParam(4, 0.0, 0.0)
            bone['Constraint'].setParam(5, r(-135), 0.0)
        else:
            bone['Constraint'].setParam(4, 0.0, 0.0)
            bone['Constraint'].setParam(5, 0.0, r(135))
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
    elif bone_name in ['Hand_R','Hand_L']:
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, 0.0, 0.0)
        bone['Constraint'].setParam(4, r(-45), r(45))
        bone['Constraint'].setParam(5, r(-45), r(45))
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
    elif bone_name in ['Thigh_R','Thigh_L']:
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, r(-80), r(45))
        bone['Constraint'].setParam(4, r(-20), r(20))
        bone['Constraint'].setParam(5, r(-20), r(20))
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
    elif bone_name in ['Knee_R','Knee_L']:
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, 0.0, r(90))
        bone['Constraint'].setParam(4, 0.0, 0.0)
        bone['Constraint'].setParam(5, 0.0, 0.0)
        bone['Constraint'].setParam(15, 100, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
    elif bone_name in ['Foot_R','Foot_L']:
        if create:
            bone['Constraint'] = constraints.createConstraint( bone.getPhysicsId(), target.getPhysicsId(), 12 , 0, 0, 0, offsetx, offsety, offsetz, flag )
        bone['Constraint'].setParam(0, 0.0, 0.0)
        bone['Constraint'].setParam(1, 0.0, 0.0)
        bone['Constraint'].setParam(2, 0.0, 0.0)
        bone['Constraint'].setParam(3, r(-20), r(20))
        bone['Constraint'].setParam(4, r(-5), r(5))
        bone['Constraint'].setParam(5, r(-20), r(20))
        bone['Constraint'].setParam(15, 0, 1)
        bone['Constraint'].setParam(16, 0, 1)
        bone['Constraint'].setParam(17, 0, 1)
        
        
def Targets(x):
    return {
        'Spine': 'Pelvis',
        'Chest': 'Spine',
        'Neck': 'Chest',
        'Head': 'Neck',
        'Shoulder_R': 'Chest',
        'UpArm_R': 'Shoulder_R',
        'LoArm_R': 'UpArm_R',
        'Hand_R': 'LoArm_R',
        'Shoulder_L': 'Chest',
        'UpArm_L': 'Shoulder_L',
        'LoArm_L': 'UpArm_L',
        'Hand_L': 'LoArm_L',
        'Thigh_R': 'Pelvis',
        'Knee_R': 'Thigh_R',
        'Foot_R': 'Knee_R',
        'Thigh_L': 'Pelvis',
        'Knee_L': 'Thigh_L',
        'Foot_L': 'Knee_L',
    }[x]
    
def Weights(x):
    totalMass = 210
    return {
        'Pelvis': 0.17*totalMass,
        'Spine': 0.17*totalMass,
        'Chest': 0.17*totalMass,
        'Neck': 0.024*totalMass,
        'Head': 0.073*totalMass,
        'Shoulder_R': 0.0066*totalMass,
        'UpArm_R': 0.027*totalMass,
        'LoArm_R': 0.016*totalMass,
        'Hand_R': 0.0066*totalMass,
        'Shoulder_L': 0.0066*totalMass,
        'UpArm_L': 0.027*totalMass,
        'LoArm_L': 0.016*totalMass,
        'Hand_L': 0.0066*totalMass,
        'Thigh_R': 0.0988*totalMass,
        'Knee_R': 0.0465*totalMass,
        'Foot_R': 0.0145*totalMass,
        'Thigh_L': 0.0988*totalMass,
        'Knee_L': 0.0465*totalMass,
        'Foot_L': 0.0145*totalMass,
    }[x]
    
def Offsets(x):
    factor = 2.5
    return {
        'Pelvis': 0.25*factor,
        'Spine': 0.25*factor,
        'Chest': 0.25*factor,
        'Neck': 0.25*factor,
        'Head': 0.25*factor,
        'Shoulder_R': 0.25*factor,
        'UpArm_R': 0.25*factor,
        'LoArm_R': 0.5*factor,
        'Hand_R': 0.5*factor,
        'Shoulder_L': 0.25*factor,
        'UpArm_L': 0.25*factor,
        'LoArm_L': 0.5*factor,
        'Hand_L': 0.5*factor,
        'Thigh_R': 0.25*factor,
        'Knee_R': 0.25*factor,
        'Foot_R': 0.5*factor,
        'Thigh_L': 0.25*factor,
        'Knee_L': 0.25*factor,
        'Foot_L': 0.5*factor,
    }[x]