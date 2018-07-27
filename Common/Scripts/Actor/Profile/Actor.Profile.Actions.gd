
var Profile_Actions = {

    'Default' : {
    
        'rank' : 0,
    
        'value' : 0.5,
        'rate' : 0.25,
        'delay' : 0.0,
        
        'triggers' : null,
        'event' : null,
            
        },

    'Loitering' : {
     
        'rank' : 1,
     
        'value' : 1.0,
        'rate' : 0.2,
        'delay' : 3000.0,
         
        'triggers' : [
            'Standing',
            'InWalkZone',
            ],
        'event' : 'Player_Loitering',
             
        },
     
    'Running' : {
     
        'rank' : 1,
     
        'value' : 1.0,
        'rate' : 0.5,
        'delay' : 0.0,
         
        'triggers' : [
            'Running',
            'InWalkZone',
            ],
        'event' : 'Player_Inappropriate',
             
        },
     
    'RapidStanceChange' : {
     
        'rank' : 1,
     
        'value' : 1.0,
        'rate' : 0.5,
        'delay' : 0.0,
         
        'triggers' : [
            'JustChangedStance',
            ],
        'event' : 'Player_Inappropriate',
         
        },
    
    'Staring' : {
     
        'rank' : 1,
     
        'value' : 1.0,
        'rate' : 0.1,
        'delay' : 0.0,
         
        'triggers' : [
            'StaringAtNPC',
            ],
        'event' : 'Player_Staring',
         
        },
     
#     'Blendin' : {
#      
#         'rank' : 1,
#      
#         'value' : 0.25,
#         'rate' : 0.5,
#         'delay' : 0.0,
#          
#         'triggers' : [
#             'InBlendin',
#             ],
#         'event' : null,
#              
#         },

    }