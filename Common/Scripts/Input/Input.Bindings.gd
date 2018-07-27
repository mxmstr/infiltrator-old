
const Input_Bindings = {
    
    'Pass' : {},
    
    'Movement' : {
        
        'Forward' :             [KEY_W,],
        'Backward' :            [KEY_S,],
        'Left' :                [KEY_A,],
        'Right' :               [KEY_D,],
        'LeanLeft' :            [KEY_Q,],
        'LeanRight' :           [KEY_E,],
        'LeanReset' :           [KEY_E,
                                 KEY_Q,],
        'Walk' :                [KEY_MASK_SHIFT,
                                 KEY_MASK_CTRL],
        'Run' :                 [KEY_MASK_SHIFT,],
        'Crouch' :              [KEY_MASK_CTRL,],
        
        },
    
    'Abilities' : {
    
        'Action_Primary' :      [BUTTON_LEFT,],
        'Throw' :               [BUTTON_RIGHT,],
        'Pickup' :              [BUTTON_RIGHT,],
        'Dequip' :              [BUTTON_MIDDLE, 
                                 KEY_TAB],
        'Reload' :              [KEY_R,],
        'Interaction_Menu' :    [KEY_SPACE,],
        'Inventory' :           [BUTTON_WHEEL_UP,
                                 BUTTON_WHEEL_DOWN,
                                 KEY_DOWN,
                                 KEY_UP],
                 
        },
    
    'Action_Primary' : {
    
        'Cancel' :              [BUTTON_LEFT,],
                 
        },
    
    'Menu_Popup' : {
                  
        'Up' :                  [BUTTON_WHEEL_UP,
                                 KEY_UP],
        'Down' :                [BUTTON_WHEEL_DOWN,
                                 KEY_DOWN],     
        'Select' :              [BUTTON_LEFT,],
        'Close' :               [BUTTON_RIGHT,],
        
        },
    
    'Menu_Interaction' : {
    
        'Open' :                [KEY_SPACE,],
        'Up' :                  [BUTTON_WHEEL_UP,
                                 KEY_UP],
        'Down' :                [BUTTON_WHEEL_DOWN,
                                 KEY_DOWN],     
        'Select' :              [KEY_SPACE,], 
        
        },
                 
    'Drag' : {
    
        'Cancel' :              [BUTTON_RIGHT,],
    
        },
                 
    'Human_Shield' : {
    
        'Cancel' :              [BUTTON_LEFT,
                                 KEY_SPACE],
        
        },
    
    }