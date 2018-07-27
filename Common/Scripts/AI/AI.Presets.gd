
const AI_Presets = {
    
    'Rank' : {
        'Player' : 0,
        'Guard' : 2,
        'Civilian' : 1,
        },

    'Events' : {
    
        'Default_Roam' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Item_Noise' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Item_On_Ground' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Ragdoll_Needs_Dumped' : {
            'Observers' : ['Guard',],
            },
        'Ragdoll_On_Ground' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Ragdoll_Constant' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Inappropriate' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Loitering' : {
            'Observers' : ['Guard',],
            },
        'Player_Staring' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Noise_Footsteps_Walk' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Noise_Footsteps_Run' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_ItemThrower_Suspect' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_ItemThrower_Caught' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Sneaking_Caught' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Near_Restricted' : {
            'Observers' : ['Guard',],
            },
        'Player_Trespassing_Caught' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Murder_Suspect' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Shooter_Noise' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Shooter_Suspect' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Needs_Reported' : {
            'Observers' : ['Civilian',],
            },
        'Player_Pickpocketing' : {
            'Observers' : ['Guard', 'Civilian'],
            },    
        'Player_BodyDrag_Caught' : {
            'Observers' : ['Civilian',],
            },    
        'Player_Dragging_Body' : {
            'Observers' : ['Guard',],
            },
        'Player_ItemStealer_Caught' : {
            'Observers' : ['Civilian',],
            },    
        'Player_Carrying_Stolen_Item' : {
            'Observers' : ['Guard',],
            },
        'Player_MeleeCarry_Caught' : {
            'Observers' : ['Civilian',],
            },    
        'Player_Carrying_Melee' : {
            'Observers' : ['Guard',],
            },
        'Player_GunCarry_Caught' : {
            'Observers' : ['Civilian',],
            },    
        'Player_Carrying_Gun' : {
            'Observers' : ['Guard',],
            },
        'Player_Brawler_Caught' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Shooter_Caught' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'Player_Is_Spy' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'NPC_Shooter_Noise' : {
            'Observers' : ['Guard', 'Civilian'],
            },
        'NPC_Reporting_Crime' : {
            'Observers' : ['Guard',],
            },
        'NPC_Attacking_Player' : {
            'Observers' : ['Guard', 'Civilian'],
            },
    
        },

    }


# old_events = AI_Presets['Events'].copy[)
# new_events = Mission_AI_Presets['Events'].copy[)
# old_events.update[new_events)
# 
# AI_Presets.update[Mission_AI_Presets)
# AI_Presets['Events'] = old_events