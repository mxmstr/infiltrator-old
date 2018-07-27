
const Input_Results = {
    
    'Pass' : {},
    
    'Movement' : {
        
        'Forward' : {
            'Status' : ['pressed',],
            'Results' : ['MoveForward',],
            'Interactions' : null,
            },
        'Backward' : {
            'Status' : ['pressed',],
            'Results' : ['MoveBackward',],
            'Interactions' : null,
            },
        'Left' : {
            'Status' : ['pressed',],
            'Results' : ['MoveLeft',],
            'Interactions' : null,
            },
        'Right' : {
            'Status' : ['pressed',],
            'Results' : ['MoveRight',],
            'Interactions' : null,
            },
        'LeanLeft' : {
            'Status' : ['pressed',],
            'Results' : ['StartLeanLeft',],
            'Interactions' : null,
            },
        'LeanRight' : {
            'Status' : ['pressed',],
            'Results' : ['StartLeanRight',],
            'Interactions' : null,
            },
        'LeanReset' : {
            'Status' : ['just_released',],
            'Results' : ['StartLeanReset',],
            'Interactions' : null,
            },
        'Walk' : {
            'Status' : ['just_released',],
            'Results' : ['StartWalk',],
            'Interactions' : null,
            },
        'Run' : {
            'Status' : ['just_pressed',],
            'Results' : ['StartRun',],
            'Interactions' : null,
            },
        'Crouch' : {
            'Status' : ['just_pressed',],
            'Results' : ['StartCrouch',],
            'Interactions' : null,
            },
        
        },
    
    'Abilities' : {
    
        'Action_Primary' : {
            'Status' : [
                'just_pressed',
                'pressed',
                ],
            'Results' : null,
            'Interactions' : ['Action_Primary',],
            },
        'Throw' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : [
                'Throw',
                'Pickup',
                ],
            },
        'Pickup' : {
            'Status' : ['just_released',],
            'Results' : null,
            'Interactions' : [
                'Drop',
                'Disarm',
                'Drag',
                'Pickpocket',
                ],
            },
        'Dequip' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Dequip',],
            },
        'Reload' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Reload',],
            },
        'Interaction_Menu' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['OpenInteractionMenu',],
            },
        'Inventory' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['OpenInventory',],
            },
    
        },
        
    'Action_Primary' : {
    
        'Cancel' : {
            'Status' : [null,],
            'Results' : null,
            'Interactions' : ['Cancel',],
            },
                 
        },  
             
    'Menu_Popup' : {
                  
        'Up' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Up',],
            },
        'Down' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Down',],
            },  
        'Select' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Select',],
            },
        'Close' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Close',],
            },
    
        },
    
    'Menu_Interaction' : {
    
        'Up' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Up',],
            },
        'Down' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Down',],
            },
        'Select' : {
            'Status' : ['just_released',],
            'Results' : null,
            'Interactions' : ['Select',],
            },
        
        },
                 
    'Drag' : {
    
        'Cancel' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Cancel',],
            },
    
        },
                 
    'Human_Shield' : {
    
        'Cancel' : {
            'Status' : ['just_pressed',],
            'Results' : null,
            'Interactions' : ['Cancel',],
            },
        
        },
    
    }