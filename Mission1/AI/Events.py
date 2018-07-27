from bge import logic
from Settings_General import *


Mission_Event_Properties = {

    'Default' : {
        
    },

    'Item' : {
        
    },
    
    'Ragdoll' : {
        
    },

    'Player' : {
        
        'Near_ItemTable' : {
            
            'trigger': 'Player_NearItemTable',
            
            'rank' : 30,
            'expiration_time' : -1.0,
            'trigger_delay': 1.0,
            
            'can_invalidate' : True,
            'simultaneous_examination' : True,
            'repeat_examination' : False,
            
            'range' : SightRange_Suspicious,
            'xray_range' : 0.0,
            'examine_dist' : 2.0,
            
            'suspicion' : (0.0, 0.0, 0.0),
            'anxiety' : (0.0, 1.0, 0.0),
            'identity' : (0, 2, 0),
            
            'results' : (
                ('ManeuverDefault', 1.0, True, 0.0, 'combat_normal', None),
                ('ManeuverForward', 25.0, True, 0.0, 'combat_normal', 'Remark_Near_Restricted'),
                ),
                
            'exit_success' : 'SetSuspicion',
            'exit_failure' : 'Reset'
            
        },
        
    },
    
    'NPC' : {
        
    },
    
}