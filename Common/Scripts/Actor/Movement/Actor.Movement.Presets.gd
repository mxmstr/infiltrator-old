
var Movement_Presets = {
    
    'Default' : {
        
        'can_change_stance' : true,
        'enable_rotation' : true,
        'input_rotation' : 'InputRotationDefault',
        'lean_direction' : 'LeanReset',
        
        'walk' : Globals.Walk_Mult,
        'run' : Globals.Run_Mult,
        'crouch' : Globals.Crouch_Mult,
        'prone' : Globals.Prone_Mult,
        
        },
        
    'Lock_Position' : {
        
        'can_change_stance' : false,
        'enable_rotation' : true,
        'input_rotation' : 'InputRotationDefault',
        'lean_direction' : 'LeanReset',
        
        'walk' : 0.0,
        'run' : 0.0,
        'crouch' : 0.0,
        'prone' : 0.0,
        
        },     
              
    'Lock_Rotation' : {
        
        'can_change_stance' : true,
        'enable_rotation' : false,
        'input_rotation' : 'InputRotationDefault',
        'lean_direction' : 'LeanReset',
        
        'walk' : Globals.Walk_Mult,
        'run' : Globals.Run_Mult,
        'crouch' : Globals.Crouch_Mult,
        'prone' : Globals.Prone_Mult,
        
        },                             
              
    'Interact' : {
        
        'can_change_stance' : false,
        'enable_rotation' : false,
        'input_rotation' : 'InputRotationDefault',
        'lean_direction' : 'LeanReset',
        
        'walk' : 0.0,
        'run' : 0.0,
        'crouch' : 0.0,
        'prone' : 0.0,
        
        },
    
    'Interact_Cam_Rotation' : {
        
        'can_change_stance' : false,
        'enable_rotation' : false,
        'input_rotation' : 'InputRotationCam',
        'lean_direction' : 'LeanReset',
        
        'walk' : 0.0,
        'run' : 0.0,
        'crouch' : 0.0,
        'prone' : 0.0,
        
        },     
              
    'LeanLeft' : {
        
        'can_change_stance' : true,
        'enable_rotation' : true,
        'input_rotation' : 'InputRotationDefault',
        'lean_direction' : 'LeanLeft',
        
        'walk' : 0.0,
        'run' : 0.0,
        'crouch' : 0.0,
        'prone' : 0.0,
        
        },
                    
    'LeanRight' : {
        
        'can_change_stance' : true,
        'enable_rotation' : true,
        'input_rotation' : 'InputRotationDefault',
        'lean_direction' : 'LeanRight', 
        
        'walk' : 0.0,
        'run' : 0.0,
        'crouch' : 0.0,
        'prone' : 0.0,
        
        },
    
    }