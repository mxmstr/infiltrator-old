
var Interaction_Presets = {

    'Pass' : {
        
        'States' : null,
        
        'Default' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        },

    'Sensor_Actor' : {
        
        'States' : ['Human Shield', 'Talk', 'Search'],
        
        'Default' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        'Human Shield' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : ['RightHandHasPistol',],
            'Enter' : [
                ['StartHSAct',],
                ['ResetInteraction',],
                ],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
               
        'Talk' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [
                ['OpenDialogueMenu',],
                ],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                      
        'Search' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [
                ['OpenSearchMenu',],
                ],
            'Execute' : [
                ['CheckSearchCancelled',],
                ],
            'Exit' : [['Pass',],],
            },
        
        },

    'Actor_Default' : {
        
        'States' : null,
        
        'Default' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [
                ['ResetActionAnimation',],
                ],
            'Execute' : [
                ['CheckCanIdle',],
                ],
            'Exit' : [    
                ['ResetIdleTimer',],
                ['HideInteractionIcon',],
                ],
            },

        'Blendin' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [
                ['EnableBlendinDisplay',],
                ['StartBlendin',],
                ],
            'Execute' : [
                ['CheckBlendinCancel',],
                ],
            'Exit' : [
                ['ResetIdleTimer',],
                ['DisableBlendinDisplay',],
                ],
            },
                      
        'Action_Primary' : {
            'Params' : [null,],
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Action_Primary',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : ['RightHandHasAnim',],
            'Enter' : [['StartActionAnim', 0],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                      
        'Throw' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : ['IsEquippedRightHand',],
            'Enter' : [['StartThrowSequence',],],
            'Execute' : [
                ['CheckThrowFrame',],
                ['CheckThrowCancel',],
                ['CheckSequenceFinished',]
                ],
            'Exit' : [['Pass',],],
            },
                      
        'Reload' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['StartReloadSequence',],],
            'Execute' : [['CheckSequenceFinished',],],
            'Exit' : [['Pass',],],
            },
                      
        'Pickup' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : ['IsUnarmed',],
            'Enter' : [['FindPickupItem',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                      
        'Act_Pickup' : {
            'Params' : null,
            'Dist' : 2.5,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Interact',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [
                ['SetCamArmature',],
                ['StartPickupSequence',],
                ],
            'Execute' : [
                ['CheckPickupFrame',],
                ['CheckSequenceFinished',],
                ],
            'Exit' : [['ResetCamera',],],
            },
                      
        'Drop' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : ['IsEquippedRightHand',],
            'Enter' : [['StartDropSequence',],],
            'Execute' : [
                ['CheckDropFrame',],
                ['CheckSequenceFinished',],
                ],
            'Exit' : [['Pass',],],
            },
                      
        'Equip' : {
            'Params' : [null],
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : ['IsUnarmed',],
            'Enter' : [['StartEquipSequence',],],
            'Execute' : [
                ['CheckEquipFrame',],
                ['CheckSequenceFinished',],
                ],
            'Exit' : [['Pass',],],
            },
                      
        'Dequip' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : [
                'IsEquippedRightHand',
                'CanStoreRightHand',
                ],
            'Enter' : [['StartDequipSequence',],],
            'Execute' : [
                ['CheckDequipFrame',],
                ['CheckSequenceFinished',],
                ],
            'Exit' : [['Pass',],],
            },         
                           
        'Pickpocket' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : ['IsUnarmed',],
            'Enter' : [['FindPickpocketTarget',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                      
        'Act_Pickpocket' : {
            'Params' : null,
            'Dist' : 1.5,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['CheckPickpocketFrame',],],
            'Exit' : [['Pass',],],
            },
                      
        'Drag' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : ['IsUnarmed',],
            'Enter' : [['FindDragTarget',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                      
        'Act_Drag' : {
            'Params' : null,
            'Dist' : 2.5,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Drag',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['StartDrag',],],
            'Execute' : [['DragRagdoll',],],
            'Exit' : [['DropRagdoll',],],
            },
                      
        'React_Drag' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },              
        
        'Act_Dialogue' : {
            'Params' : [null],
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Menu_Popup',
            'Movement_Preset' : 'Interact',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['StartDialogueReact',],],
            'Execute' : [['ExecuteDialogueNode', 0],],
            'Exit' : [['Pass',],],
            },
                      
        'React_Dialogue' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Menu_Popup',
            'Movement_Preset' : 'Interact',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['LockDialogueOrientation',],],
            'Exit' : [['Pass',],],
            },
                      
        'Act_HS' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['StartHSReact', null],],
            'Execute' : [['CheckHSCancelled', null],],
            'Exit' : [['Pass',],],
            },
                      
        'React_HS' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['StartHSSequence',],],
            'Execute' : [['MoveHS',],],
            'Exit' : [['Pass',],],
            },
                      
        'Disarm' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : ['IsUnarmed',],
            'Enter' : [['FindDisarmTarget',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                      
        'Act_Disarm' : {
            'Params' : null,
            'Dist' : 1.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 0.4,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 0.4,
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['StartActDisarmSequence',],],
            'Execute' : [
                ['LockDisarmMovement',],
                ['CheckSequenceFinished',],
                ],
            'Exit' : [['Pass',],],
            },
                      
        'React_Disarm' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['StartReactDisarmSequence',],],
            'Execute' : [
                ['LockDisarmMovement',],
                ['CheckSequenceFinished',],
                ],
            'Exit' : [['Pass',],],
            },
                      
        'Act_Vault' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Interact_Cam_Rotation',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['SetCamArmature',],],
            'Execute' : [
                ['LockVaultOrientation',],
                ['CheckSequenceFinished',],
                ],
            'Exit' : [  
                ['SetCollisionToArmature',],
                ['ResetCamera',],
                ],    
            },
                      
        'Frisk' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                      
        'Arrest' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Abilities',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                      
        'OpenInteractionMenu' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Menu_Interaction',
            'Movement_Preset' : 'Default', 
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['OpenInteractionMenu',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                      
        'OpenInventory' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Menu_Popup',
            'Movement_Preset' : 'Default',
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['OpenInventory',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        },
    
    'Actor_Action_Primary' : {
        
        'States' : [null],
        
        'Default' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Action_Primary',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['CheckActionReady',],],
            'Exit' : [['Pass',],],
            },
        
        'Cancel' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Action_Primary',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : ['CanCancelAction',],
            'Enter' : [['ExitAction',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        },
    
    'Actor_Drag' : {
        
        'States' : null,
        
        'Default' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Drag',
            'Movement_Preset' : 'Default',
            'Enable_Events' : true,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        },
                       
    'Actor_HS' : {
        
        'States' : null,
        
        'Default' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Human_Shield',
            'Movement_Preset' : 'Default',
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                  
        'Cancel' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Human_Shield',
            'Movement_Preset' : 'Default',
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['CancelHS',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        },            
                      
    'Actor_Menu_Popup' : {
        
        'States' : null,
        
        'Default' : {
            'Params' : [],
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : true,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                          
        'Up' : {
            'Params' : [],
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : true,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [
                ['MenuPopupUp',],
                ['ResetInteraction',],
                ],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                          
        'Down' : {
            'Params' : [],
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : true,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [
                ['MenuPopupDown',],
                ['ResetInteraction',],
                ],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                          
        'Select' : {
            'Params' : [],
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : true,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [
                ['MenuPopupSelect',],
                ],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                          
        'Close' : {
            'Params' : [],
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : true,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [
                ['MenuPopupClose',],
                ],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        },
    
    'Actor_Dead' : {
        
        'States' : null,
        
        'Default' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Pass',
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                    
        'React_Drag' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Pass',
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                    
        'Fall' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Pass',
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                    
        'Prone' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Pass',
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [
                ['StartProneTimer',],
                ],
            'Execute' : [
                ['CheckProneFinished',],
                ],
            'Exit' : [
                ['ResetProneTimer',]
                ]
            },
                    
        'Ragdoll' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : 'Pass',
            'Movement_Preset' : 'Pass',
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : true,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        },

    'Door_Right' : {
        
        'States' : ['Close', 'Open'],
        
        'Close' : {
            'Params' : ['Door_RotateRight', 0.0, 40.0, true],
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                    
        'Open' : {
            'Params' : ['Door_RotateRight', 0.0, 40.0, false],
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                    
        },
    
    'Door_Left' : {
        
        'States' : ['Close', 'Open'],
        
        'Close' : {
            'Params' : ['Door_RotateRight', 0.0, 40.0, false],
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                   
        'Open' : {
            'Params' : ['Door_RotateRight', 0.0, 40.0, true],
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        },
        
    'Railing' : {
        
        'States' : ['Vault',],
        
        'Default' : {
            'Params' : null,
            'Dist' : 0.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [['Pass',],],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
                 
        'Vault' : {
            'Params' : null,
            'Dist' : 3.0,
            'Obj_Min_Angle' : 0.0,
            'Obj_Max_Angle' : 3.15,
            'Subj_Min_Angle' : 0.0,
            'Subj_Max_Angle' : 3.15,
            'Input_Context' : null,
            'Movement_Preset' : null,
            'Enable_Events' : false,
            'Inherit_Subj' : false,
            'Must_Be_Reset' : false,
            'Triggers' : null,
            'Enter' : [
                ['StartVaultAct',],
                ['ResetInteraction',],
                ],
            'Execute' : [['Pass',],],
            'Exit' : [['Pass',],],
            },
        
        },
        
    }        