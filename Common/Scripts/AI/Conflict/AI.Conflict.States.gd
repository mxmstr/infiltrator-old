
var Conflict_States = {

    'Pass' : {},
    
    'Stand' : {
    
        'Target' : {
            
            'stance' : 'Walk',
            'item_max_rank' : -1,
            'item_ready' : false,
            'strafe' : false,
            
            'scores' : [
                [1.0, 'HasTarget', 'Bool', 0.0],
                ],
            
            'actions' : [
                'RotateToTarget',
                ],
            
            },
        
        'Event' : {
            
            'stance' : 'Walk',
            'item_max_rank' : -1,
            'item_ready' : false,
            'strafe' : false,
            
            'scores' : [
                [1.0, 'NoTarget', 'Bool', 0.0],
                ],
            
            'actions' : [
                'RotateToEvent',
                ],
            
            },
    
        },

    'Follow' : {
    
        'Target' : {
            
            'stance' : 'Walk',
            'item_max_rank' : -1,
            'item_ready' : false,
            'strafe' : false,
            
            'scores' : [
                [1.0, 'HasTarget', 'Bool', 0.0],
                ],
            
            'actions' : [
                'MoveToTarget',
                'DequipWeapon',
                ],
            
            },
        
        'Event' : {
            
            'stance' : 'Walk',
            'item_max_rank' : -1,
            'item_ready' : false,
            'strafe' : false,
            
            'scores' : [
                [1.0, 'NoTarget', 'Bool', 0.0],
                ],
            
            'actions' : [
                'MoveToEvent',
                'DequipWeapon',
                ],
            
            },
    
        },
    
    'Chase' : {
    
        'Target' : {
            
            'stance' : 'Run',
            'item_max_rank' : -1,
            'item_ready' : false,
            'strafe' : false,
            
            'scores' : [
                [1.0, 'HasTarget', 'Bool', 0.0],
                ],
            
            'actions' : [
                'MoveToTarget',
                ],
            
            },
        
        'Event' : {
            
            'stance' : 'Run',
            'item_max_rank' : -1,
            'item_ready' : false,
            'strafe' : false,
            
            'scores' : [
                [1.0, 'NoTarget', 'Bool', 0.0],
                ],
            
            'actions' : [
                'MoveToEvent',
                ],
            
            },
    
        },
    
    'Combat' : {
        
#         'Arrest' : {
#             
#             'stance' : 'Run',
#             'item_max_rank' : 1,
#             'item_ready' : true,
#             'strafe' : false,
#             
#             'scores' : null,
#             
#             'actions' : [
#                 'Arrest',
#                 ],
#             
#             },
    
        'Attack' : {
            
            'stance' : 'Run',
            'item_max_rank' : 3,
            'item_ready' : true,
            'strafe' : false,
            
            'scores' : null,
#                 [0.5, 'TargetHostile', 'Bool', 0.0],
#                 [0.5, 'HasEquivalentWeapon', 'Bool', 0.0],
#                 ],
            
            'actions' : [
                'FireWeapon',
                ],
        
            },
    
#        'Search' : {
#            
#            'scores' : [
#                [1.0, 'TargetLost', 'Bool', 0.0],
#                [-1.0, 'ClipEmpty', 'Bool', 0.0],
#                ],
#            
#            'stance' : 1.0,
#            'ready_item' : false,
#            
#            },
#    
#        'Advance' : {
#            
#            'scores' : [
#                [0.5, 'TargetPosKnown', 'Bool', 0.0],
#                [0.5, 'TargetNotInSight', 'Bool', 0.0],
#                [-0.5, 'ClipEmpty', 'Bool', 0.0],
#                ],
#        
#            'stance' : 1.0,
#            'ready_item' : true,
#        
#            },
#            
#        'Fire' : {
#            
#            'scores' : [
#                [0.75, 'TargetInSight', 'Bool', 0.0],
#                [0.5, 'CoverNotInRange', 'Bool', 0.0],
#                [-1.25, 'ClipEmpty', 'Bool', 0.0],
#                ],
#        
#            'stance' : 1.0,
#            'ready_item' : true,
#        
#            },
#            
#        'Cover' : {
#            
#            'scores' : [
#                [0.5, 'NotInCover', 'Bool', 0.0],
#                [0.5, 'CoverInRange', 'Bool', 0.0],
#                ],
#            
#            'stance' : 1.0,
#            'ready_item' : false,
#            
#            }, 
#            
#        'Reload' : {
#            
#            'scores' : [
#                [0.75, 'ClipEmpty', 'Bool', 0.0],
#                [0.5, 'InCover', 'Bool', 0.0],
#                [0.5, 'ClipFull', 'Bool', 0.0],
#                ],
#            
#            'stance' : 1.0,
#            'ready_item' : false,
#            
#            },
#    
#        'Retreat' : {
#        
#            },
    
        },

    }