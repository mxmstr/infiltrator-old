

var AI_Events = {

    'Default' : {

        'Roam' : {
        
            'trigger': 'Constant',
            
            'rank' : 0,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : true,
            
            'sight_range' : 500.0,
            'xray_range' : 500.0,
            'examine_dist' : 1.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 0],
            
        },
        
    },

    'Item' : {

        'Noise' : {
        
            'trigger': 'Item_HardCollision',
            
            'rank' : 1,
            'expiration_time' : 0.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SoundRange_Normal,
            'xray_range' : Globals.SoundRange_Normal,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 0],
            
        },
        
        'On_Ground' : {
        
            'trigger': 'Item_On_Ground',
            
            'rank' : 1,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : false,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Normal,
            'xray_range' : 0.0,
            'examine_dist' : 1.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 0],
            
        },
        
    },
    
    'Ragdoll' : {
    
        'On_Ground' : {
        
            'trigger': 'Ragdoll_On_Ground',
            
            'rank' : 40,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Normal,
            'xray_range' : 0.0,
            'examine_dist' : 1.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 25.0],
            'identity' : [0, 0, 0],
            
        },
        
    },
    
    'Player' : {
        
        'Loitering' : {
        
            'trigger': null,
            
            'rank' : 1,
            'expiration_time' : 3.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : true,
            
            'sight_range' : Globals.SightRange_Normal,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.5, 0.0],
            'identity' : [0, 2, 0],
            
        },
        
        'Inappropriate' : {
        
            'trigger': null,
            
            'rank' : 2,
            'expiration_time' : 3.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : true,
            
            'sight_range' : Globals.SightRange_Normal,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.5, 0.0],
            'identity' : [0, 2, 0],
            
        },
        
        'Staring' : {
        
            'trigger': null,
            
            'rank' : 2,
            'expiration_time' : 3.0,
            'trigger_delay': 1.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : true,
            
            'sight_range' : Globals.SightRange_Normal,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.5, 0.0],
            'identity' : [0, 2, 0],
            
        },
    
        'Noise_Footsteps_Walk' : {
        
            'trigger': null,
            
            'rank' : 2,
            'expiration_time' : 0.0,
            'trigger_delay': 1.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : 0.0,
            'xray_range' : Globals.SoundRange_Close,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 1, 0],
            
        },
        
        'Noise_Footsteps_Run' : {
        
            'trigger': null,
            
            'rank' : 3,
            'expiration_time' : 0.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Normal,
            'xray_range' : Globals.SoundRange_Normal,
            'examine_dist' : -1.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 2, 0],
            
        },
    
        'ItemThrower_Suspect' : {
        
            'trigger': null,
            
            'rank' : 10,
            'expiration_time' : 3.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : false,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : -1.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 0],
            
        },
    
        'ItemThrower_Caught' : {
            
            'trigger': null,
            
            'rank' : 11,
            'expiration_time' : 0.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 0],
            
        },
        
        'Sneaking_Caught' : {
            
            'trigger': 'Player_Crouching',
            
            'rank' : 20,
            'expiration_time' : null,
            'trigger_delay': 1.0,
            
            'can_invalidate' : true,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 2.5, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 2, 0],
            
        },
        
        'Near_Restricted' : {
            
            'trigger': 'Player_InSuspiciousArea',
            
            'rank' : 30,
            'expiration_time' : null,
            'trigger_delay': 1.0,
            
            'can_invalidate' : true,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Normal,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 1.0, 0.0],
            'identity' : [0, 2, 0],
            
        },
        
        'Trespassing_Caught' : {
            
            'trigger': 'Player_Trespassing',
            
            'rank' : 31,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : true,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 3.0,
            
            'suspicion' : [0.0, 10.0, 100.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 2, 0],
            
        },
        
        'Murder_Suspect' : {
            
            'trigger': 'Player_NearRagdoll',
            
            'rank' : 32,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : true,
            'simultaneous_examination' : false,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 10.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 2, 0],
            
        },
        
        'Shooter_Noise' : {
            
            'trigger': null,
            
            'rank' : 43,
            'expiration_time' : 0.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SoundRange_Alert,
            'xray_range' : Globals.SoundRange_Alert,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 0],
            
        },
        
        'Shooter_Suspect' : {
        
            'trigger': null,
            
            'rank' : 44,
            'expiration_time' : 6.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : false,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 5.0,
            
            'suspicion' : [0.0, 20.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 1, 0],
            
        },
        
        'Pickpocketing' : {
            
            'trigger': 'Player_Pickpocketing',
            
            'rank' : 52,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 2],
            
        },
        
        'BodyDrag_Caught' : {
            
            'trigger': 'Player_Dragging',
            
            'rank' : 52,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 2],
            
        },
        
        'Dragging_Body' : {
            
            'trigger': 'Player_Dragging',
            
            'rank' : 52,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : true,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 2.5, 0.0],
            'identity' : [0, 2, 2],
            
        },
        
        'ItemStealer_Caught' : {
            
            'trigger': 'Player_Carrying_Stolen_Item',
            
            'rank' : 53,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 2],
            
        },
        
        'Carrying_Stolen_Item' : {
            
            'trigger': 'Player_Carrying_Stolen_Item',
            
            'rank' : 53,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : true,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 2.5, 0.0],
            'identity' : [0, 2, 2],
            
        },
        
        'MeleeCarry_Caught' : {
            
            'trigger': 'Player_Carrying_Melee',
            
            'rank' : 54,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Alert,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 2],
            
        },
        
        'Carrying_Melee' : {
            
            'trigger': 'Player_Carrying_Melee',
            
            'rank' : 54,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : true,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 2.5, 0.0],
            'identity' : [0, 2, 2],
            
        },
        
        'GunCarry_Caught' : {
            
            'trigger': 'Player_Carrying_Gun',
            
            'rank' : 55,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Alert,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 2],
            
        },
        
        'Carrying_Gun' : {
            
            'trigger': 'Player_Carrying_Gun',
            
            'rank' : 55,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : true,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 3.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 5.0, 0.0],
            'identity' : [0, 0, 2],
            
        },
        
        'Brawler_Caught' : {
            
            'trigger': null,
            
            'rank' : 56,
            'expiration_time' : 3.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Alert,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 0.0, 50.0],
            'identity' : [0, 0, 2],
            
        },
        
        'Shooter_Caught' : {
            
            'trigger': null,
            
            'rank' : 57,
            'expiration_time' : 3.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Alert,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 0.0, 75.0],
            'identity' : [0, 2, 2],
            
        },
        
        'Needs_Reported' : {
            
            'trigger': 'Constant',
            
            'rank' : 60,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : false,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Alert,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [100.0, 0.0, 100.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [2, 0, 2],
            
        },
        
        'Is_Spy' : {
            
            'trigger': 'Constant',
            
            'rank' : 60,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : true,
            'simultaneous_examination' : true,
            'repeat_examination' : true,
            
            'sight_range' : Globals.SightRange_Alert,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [100.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [2, 0, 0],
            
        },
        
    },   
    
    'NPC' : {
    
        'Shooter_Noise' : {
            
            'trigger': null,
            
            'rank' : 43,
            'expiration_time' : 0.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SoundRange_Alert,
            'xray_range' : Globals.SoundRange_Alert,
            'examine_dist' : 3.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 0],
                
        },
    
        'Reporting_Crime' : {
            
            'trigger': null,
            
            'rank' : 50,
            'expiration_time' : 3.0,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Close,
            'xray_range' : Globals.SoundRange_Close,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 100.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 2],
                
        },
        
        'Attacking_Player' : {
            
            'trigger': 'NPC_Attacking_Player',
            
            'rank' : 56,
            'expiration_time' : null,
            'trigger_delay': 0.0,
            
            'can_invalidate' : false,
            'simultaneous_examination' : true,
            'repeat_examination' : false,
            
            'sight_range' : Globals.SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 25.0,
            
            'suspicion' : [0.0, 0.0, 0.0],
            'anxiety' : [0.0, 0.0, 0.0],
            'identity' : [0, 0, 0],
            
        },
    
    },

}


# for type in Event_Properties.keys[]:
#     Event_Properties[type].update[Mission_Event_Properties[type]]