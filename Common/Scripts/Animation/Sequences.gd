


Animation_Sequences = {

    'Actor_Default' : {
    
        'frames' : (0.0, 0.0), 
        'layer' : 3,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
        
        },   
    
    'Actor_Default_Interaction' : {
    
        'frames' : (0.0, 1.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 1,
        'mode' : 0,
        'blend' : 0,
        'weight' : 1.0,
        
        'armature' : True,
        'interacting' : 2,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
        
        },      
        
    'Actor_Stand_Idle' : {
    
        'frames' : (0.0, 1.0), 
        'layer' : 3,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 5,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
        
        },
        
    'Actor_Crouch_Idle' : {
    
        'frames' : (0.0, 1.0), 
        'layer' : 3,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 5,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
        
        },    
    
    'Actor_Idle_Blendin' : {
    
        'frames' : (0.0, 10.0), 
        'layer' : 4,
        'speed' : 0.5,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            10.0 : ('Pause',),
        
            }
        
        },
    
    'Actor_Equip_Default' : {
    
        'frames' : (0.0, 60.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            30.0 : ('Pause', 'Equip'),
            60.0 : ('Pause',),
        
            }
        
        },    
        
    'Actor_Equip_Holster_R' : {
    
        'frames' : (0.0, 40.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            20.0 : ('Pause', 'Equip'),
            40.0 : ('Pause',),
        
            }
        
        },
        
    'Actor_Equip_Swap' : {
    
        'frames' : (0.0, 60.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            30.0 : ('Pause', 'Equip'),
            60.0 : ('Pause',),
        
            }
        
        },        
        
    'Actor_Pickup_Default' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            40.0 : ('Pause', 'Equip'),
            80.0 : ('Pause',),
        
            }
        
        },        
        
    'Actor_Throw_Default' : {
    
        'frames' : (0.0, 70.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            50.0 : ('Pause', 'Drop'),
            70.0 : ('Pause',),
        
            }
        
        },       
        
    'Actor_Throw_Large' : {
    
        'frames' : (0.0, 70.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            50.0 : ('Pause', 'Drop'),
            70.0 : ('Pause',),
        
            }
        
        },         
        
    'Actor_Drop' : {
    
        'frames' : (0.0, 70.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 5,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            50.0 : ('Pause', 'Drop'),
            70.0 : ('Pause',),
        
            }
        
        },           
    
    'Actor_Pitch' : {
    
        'frames' : (0.0, 3.0), 
        'layer' : 1,
        'speed' : 0.01,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 1.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            1.0 : ('Pause',),
        
            }
        
        },    

    'Actor_Act_Disarm' : {
    
        'frames' : (0.0, 20.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            10.0 : ('Disarm',),
        
            }
        
        },
        
    'Actor_React_Disarm' : {
    
        'frames' : (0.0, 20.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
        
        },
        
    'Actor_Act_HS' : {
    
        'frames' : (0.0, 10.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            10.0 : ('Pause',),
        
            }
        
        },   
        
    'Actor_React_HS' : {
    
        'frames' : (0.0, 10.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            #0.0 : 
        
            }
        
        },     
        
    'Actor_Action_Push' : {
    
        'frames' : (0.0, 20.0),
        'layer' : 4,
        'speed' : 0.5,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            0.0 : ('SetActionReady',),
            10.0 : ('Melee',),
            19.0 : ('SetState', 'Finished'),
            20.0 : ('SetActionReady', 0, 20),
        
            }
        
        },
        
    'Actor_React_Stun' : {
    
        'frames' : (0.0, 40.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
        
        },
        
    'Actor_Action_Pistol' : {
     
        'frames' : (0.0, 9.0),
        'layer' : 4,
        'speed' : 0.5,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
         
        'armature' : True,
        'interacting' : 1,
        'aiming' : 1,
        'ik_r' : 2,
        'ik_l' : 2,
         
        'default_state' : 'Default',
         
        'actions' : {
         
            9.0 : ('SetActionReady', 10.0, 20.0),
            10.0 : ('Shoot',),
            20.0 : ('SetActionReady', 10.0, 20.0),
         
            }
         
        },     
        
    'Actor_Action_Swing' : {
    
        'frames' : (0.0, 21.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            0.0 : ('SetActionReady',),
            15.0 : ('Melee',),
        
            }
        
        },   
        
    'Actor_Action_AssaultRifle' : {
    
        'frames' : (0.0, 9.0), 
        'layer' : 4,
        'speed' : 0.5,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 1,
        'ik_r' : 2,
        'ik_l' : 1,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            9.0 : ('SetActionReady', 10, 14),
            10.0 : ('Shoot',),
            14.0 : ('SetActionReady', 10, 14),
        
            }
        
        },        
        
    'Actor_Action_Watch' : {
    
        'frames' : (0.0, 21.0), 
        'layer' : 4,
        'speed' : 0.5,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            9.0 : ('SetActionReady',),
            14.0 : ('Repeat',),
            15.0 : ('Shoot',),
            20.0 : ('EndAction',),
        
            }
        
        },    
        
    'Actor_Reload_Pistol' : {
    
        'frames' : (0.0, 20.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            10.0 : ('Reload_Pistol',),
        
            }
        
        },     
        
    'Actor_Vault' : {
    
        'frames' : (0.0, 40.0), 
        'layer' : 4,
        'speed' : 0.75,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
        
        },
        
    'Actor_Fall' : {
    
        'frames' : (0.0, 20.0), 
        'layer' : 4,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 1,
        'aiming' : 2,
        'ik_r' : 2,
        'ik_l' : 2,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
        
        },     
    
    'Actor_Walk_Forward' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 3,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 3,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Walk_Backward' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 3,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Walk_Right' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 2,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Walk_Left' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 2,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Crouch_Forward' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 3,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Crouch_Backward' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 3,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Crouch_Right' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 2,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Crouch_Left' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 2,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },    
        
    'Actor_Run_Forward' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 3,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Run_Backward' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 3,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Run_Right' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 2,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Actor_Run_Left' : {
    
        'frames' : (0.0, 80.0), 
        'layer' : 2,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 2,
        'mode' : 1,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : True,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },
        
    'Door_RotateLeft' : {
    
        'frames' : (0.0, 40.0), 
        'layer' : 0,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : False,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },    
        
    'Door_RotateRight' : {
    
        'frames' : (0.0, 40.0), 
        'layer' : 0,
        'speed' : 1.0,
        'priority' : 0,
        'blendin' : 0,
        'mode' : 0,
        'blend' : 0,
        'weight' : 0.0,
        
        'armature' : False,
        'interacting' : 0,
        'aiming' : 0,
        'ik_r' : 0,
        'ik_l' : 0,
        
        'default_state' : 'Default',
        
        'actions' : {
        
            }
    
        },        
            

    }