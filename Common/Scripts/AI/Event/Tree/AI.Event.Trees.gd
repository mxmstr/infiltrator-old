

var SUB_FindAlternateRoute = [
    'SUB', -1.0, [
        ['OpenDoor', -1.0],
        ],
    ]  

var SUB_FollowEvent = [
    'SELECT', -1.0, [
        ['CheckCanMove', -1.0],
        SUB_FindAlternateRoute,
        ],
    ]

var SUB_FollowEventToRange = [
    ['INVERT', -1.0, [
        ['InExamineRange', -1.0],
        ],
        ],
    SUB_FollowEvent,
    ]

var Result_Trees = {

    'Default_Roam' : [
        
        ['StartRoute', -1.0],
        ['LOOP', -1.0, [
            ['Roam', -1.0],
            ['SELECT', -1.0, [
                ['SUB', -1.0, [
                    ['InTargetRange', -1.0],
                    ['SEQ', -1.0, [
                        ['RouteHasStop', -1.0],
                        ['StartStopTimer', -1.0],
                        ['RouteStop', -1.0, false, 0.0, 'Pass', null],
                        ],
                        ],
                    ['NextRouteStop', -1.0],
                    ],
                    ],
                ['SUB', -1.0, [
                    ['Pass', -1.0, false, 0.0, 'Follow', null],
                    SUB_FollowEvent,
                    ],
                    ],
                ], 
                ],
            ], 
            ],
        
        #result, time, track, pip_duration, conflict, dialogue
        
        ],
    
    'Item_Noise' : [
    
        ['Pass', 50.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 0.0, 'Stand', 'Hear_Unknown'],
        ['REPEAT', -1.0, [SUB_FollowEvent,]],
        ['Wait', 300.0, true, 0.0, 'Stand', null],

        ],
        
    'Item_On_Ground' : [
    
        ['Pass', 100.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 0.0, 'Stand', 'Sight_Item'],
        ['REPEAT', -1.0, [SUB_FollowEvent,]],
        ['PickupEventObj', -1.0, true, 0.0, 'Stand', null],

        ],
    
    'Ragdoll_On_Ground' : [
    
        ['Pass', 100.0, true, 0.0, 'Chase', null],
        ['Pass', 0.0, true, 300.0, 'Chase', 'Sight_Ragdoll'],
        ['REPEAT', -1.0, [
            ['INVERT', -1.0, [
                SUB_FollowEvent,
                ],
                ],
            ],
            ],
        ['Wait', 200.0, true, 0.0, 'Stand', null],
        ['SELECT', -1.0, [
            ['SUB', -1.0, [
                ['IsGuard', -1.0],
                ['Pass', -1.0, false, 0.0, 'Stand', 'Callout_Ragdoll_Drag'],
                ['REPEAT', -1.0, [
                    ['DragToDump', -1.0, false, 0.0, 'Follow', null],
                    SUB_FollowEvent,
                    ['EXIT', -1.0, 'DropBody'],
                    ],
                    ],
                ],
                ],
            ['SUB', -1.0, [
                ['GetNearestGuard', -1.0, false, 0.0, 'Chase', 'Callout_Report_Ragdoll'],
                ['REPEAT', -1.0, [
                    ['ReportEvent', -1.0, false, 0.0, 'Chase', null],
                    SUB_FollowEvent,
                    ],
                    ],
                ['Wait', 1000.0, false, 0.0, 'Stand', null],
                ],
                ],
            ],
            ],
            
        ],

    'Player_Inappropriate' : [
    
        ['Wait', 100.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 0.0, 'Follow', 'Remark_Inappropriate'],
        ['REPEAT', 500.0, SUB_FollowEventToRange],
        ['Wait', 500.0, true, 0.0, 'Stand', null],
        
        ],
    
    'Player_Loitering' : [
    
        ['Wait', 100.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 0.0, 'Follow', 'Remark_Loitering'],
        ['REPEAT', 500.0, SUB_FollowEventToRange],
        ['Wait', 500.0, true, 0.0, 'Stand', null],
        
        ],
    
    'Player_Staring' : [
    
        ['Wait', 100.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 0.0, 'Follow', 'Remark_Staring'],
        ['REPEAT', 500.0, SUB_FollowEventToRange],
        ['Wait', 500.0, true, 0.0, 'Stand', null],
        
        ],

    'Player_Noise_Footsteps_Walk' : [
    
        ['Pass', 100.0, true, 0.0, 'Stand', null],
        ['Pass', 300.0, true, 0.0, 'Stand', 'Hear_Walk'],
            
        ],
    
    'Player_Noise_Footsteps_Run' : [
    
        ['Pass', 50.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 0.0, 'Stand', 'Hear_Run'],
        SUB_FollowEventToRange,
        ['Wait', 200.0, true, 0.0, 'Stand', null],
            
        ],

    'Player_ItemThrower_Suspect' : [
    
        ['Pass', 200.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 0.0, 'Stand', 'Remark_ItemThrower_Suspect'],
        SUB_FollowEventToRange,
        ['Wait', 200.0, true, 0.0, 'Stand', null],
            
        ],

    'Player_ItemThrower_Caught' : [
    
        ['Pass', 50.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 300.0, 'Stand', 'Remark_ItemThrower_Caught'],
        SUB_FollowEventToRange,
        ['Wait', 500.0, true, 0.0, 'Stand', null],
    
        ],
    
    'Player_Sneaking_Caught' : [
    
        ['Wait', 100.0, true, 0.0, 'Stand', null],
        ['Pass', -1.0, true, 300.0, 'Stand', 'Remark_Sneaking_Caught'],
        ['LOOP', -1.0, SUB_FollowEventToRange],
        
        ],
    
    'Player_Near_Restricted' : [
    
        ['Pass', 100.0, true, 0.0, 'Stand', null],
        ['Pass', -1.0, true, 0.0, 'Stand', 'Remark_Near_Restricted'],
        SUB_FollowEventToRange,
        ['SetSuspicion', -1.0],
        
        ],
    
    'Player_Trespassing_Caught' : [

        ['Pass', 100.0, true, 0.0, 'Chase', null],
        ['Pass', -1.0, true, 300.0, 'Chase', 'Remark_Trespassing'],
        SUB_FollowEventToRange,
        ['SetSuspicion', -1.0],
        
        ],
    
    'Player_Murder_Suspect' : [
    
        ['Pass', 100.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 300.0, 'Stand', 'Remark_Murder_Suspect'],
        SUB_FollowEventToRange,
        
        ],
    
    'Player_Shooter_Noise' : [
    
        ['Pass', 50.0, true, 0.0, 'Chase', null],
        ['Pass', 0.0, true, 0.0, 'Chase', 'Hear_Shooter'],
        SUB_FollowEventToRange,
        ['Wait', 200.0, true, 0.0, 'Stand', null],
        
        ],
    
    'Player_Shooter_Suspect' : [
    
        ['Pass', 200.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 0.0, 'Follow', 'Remark_Shooter_Suspect'],
        SUB_FollowEventToRange,
        ['Wait', 200.0, true, 0.0, 'Stand', null],
        
        ],
    
    'Player_Pickpocketing' : [
    
        ['Pass', 50.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 300.0, 'Stand', 'Sight_Pickpocketing'],
        ['SetSuspicion', -1.0],
        
        ],
    
    'Player_BodyDrag_Caught' : [
    
        ['Pass', 50.0, true, 0.0, 'Chase', null],
        ['Pass', 0.0, true, 0.0, 'Chase', 'Sight_BodyDrag'],
        ['SetSuspicion', -1.0],
        
        ],
    
    'Player_ItemStealer_Caught' : [
    
        ['Pass', 50.0, true, 0.0, 'Chase', null],
        ['Pass', 0.0, true, 300.0, 'Chase', 'Remark_ItemStealer'],
        ['SetSuspicion', -1.0],
            
        ],
    
    'Player_MeleeCarry_Caught' : [
    
        ['Pass', 50.0, true, 0.0, 'Chase', null],
        ['Pass', 0.0, true, 300.0, 'Chase', 'Sight_MeleeCarry_Caught'],
        ['SetSuspicion', -1.0],
            
        ],
    
    'Player_GunCarry_Caught' : [
    
        ['Pass', 50.0, true, 0.0, 'Chase', null],
        ['Pass', 0.0, true, 300.0, 'Chase', 'Sight_GunCarry'],
        ['SetSuspicion', -1.0],
        
        ],
    
    'Player_Brawler_Caught' : [
    
        ['Pass', 50.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 300.0, 'Stand', 'Sight_MeleeCarry'],
        ['SetSuspicion', -1.0],
        
        ],
    
    'Player_Shooter_Caught' : [
    
        ['Pass', 50.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 300.0, 'Stand', 'Sight_Shooter'],
        ['SetSuspicion', -1.0],
        
        ],
    
    'Player_Needs_Reported' : [
        
        ['Pass', 50.0, true, 0.0, 'Stand', null],
        ['GetNearestGuard', 0.0, false, 0.0, 'Stand', 'Callout_Report_Crime'],
        ['REPEAT', -1.0, [
            ['ReportEvent', 0.0, false, 0.0, 'Chase', null],
            SUB_FollowEvent,
            ], 
            ],
        
        ],
    
    'Player_Is_Spy' : [
        
        ['LOOP', -1.0, [
            ['SELECT', -1.0, [
                ['SUB', -1.0, [
                    ['IsGuard', -1.0],
                    ['Pass', -1.0, true, 0.0, 'Combat', null],
                    ],
                    ],
                ['SUB', -1.0, [
                    ['HideFromPlayer_GetTarget', 0.0, true, 0.0, 'Chase', 'Sight_Hostile'],
                    ['REPEAT', -1.0, [
                        ['HideFromPlayer_GoToTarget', 0.0, true, 0.0, 'Chase', 'Sight_Hostile'],
                        SUB_FollowEvent,
                        ], 
                        ],
                    ],
                    ],
                ],
                ],
            ],
            ],
        
        ],
    
    'NPC_Shooter_Noise' : [
    
        ['Pass', 50.0, true, 0.0, 'Stand', null],
        ['Pass', 0.0, true, 0.0, 'Stand', null],
        SUB_FollowEventToRange,
        ['Wait', 200.0, true, 0.0, 'Stand', null],
            
        ],

    'NPC_Reporting_Event' : [
    
        ['Pass', 100.0, false, 0.0, 'Stand', null],
        ['REPEAT', -1.0, [
            ['GoToEvent', 0.0, false, 0.0, 'Stand', null],
            SUB_FollowEventToRange,
            ],
            ],
        
        ],
    
    'NPC_Attacking_Player' : [
    
        ['Pass', 100.0, true, 0.0, 'Stand', null],
        ['InheritSuspicion', -1.0],
        
        ],
    
    }    

