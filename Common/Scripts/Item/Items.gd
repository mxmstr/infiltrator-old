
var Items = {

    'Unarmed' : {
        
        'type' : 'Unarmed',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : false,
        'is_stolen' : false,
        'always_ready' : false,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : [
            'collision_hand_r', 
            'collision_hand_l'
            ],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : 'Actor_Action_Push', 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [1.0, 5.0, 15000.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.8,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.13, 0.22, 0.08],
        
    },

    'Can' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [2.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 5.0, 0.0],
        'range_max' : 0.8,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, -90.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [[0.0, -90.0, 0.0]],
        
    },

    'Trinket' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : true,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [2.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 5.0, 0.0],
        'range_max' : 0.8,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, -0.02],
        'rot_hand' :    [0.0, -90.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.09, 0.10, 0.12],
        
    },

    'Keycard' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : true,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : 'holster_l',
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.8,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, -90.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, -90.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.05, 0.05, 0.05],
        
    },
    
    'Watch' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_l',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : 'wrist_l',
        'projectile' : 'Hitscan_Laser',
        
        'anim_primary' : 'Actor_Action_Watch', 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : null,
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.8,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.007, -0.085, -0.001],
        'rot_hand' :    [-0.078, 0.057, 1.490],
        'pos_holster' : [0.007, -0.085, -0.001],
        'rot_holster' : [-0.078, 0.057, 1.490],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.05, 0.05, 0.05],
        
    },
    
    'Syringe' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'Lighter' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'CarKey' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'CellPhone' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'Cup' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'Plate' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'Drill' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'Broom' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'Briefcase' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : 'collision_hand_l',
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : null, 
        'anim_blendin_override' : 'Actor_Stand_Idle',
        'anim_equip' : 'Actor_Equip_Swap',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [-0.0313, 0.1883, 0.0041],
        'rot_hand' :    [0.0473, 0.0827, -1.4866],
        'pos_holster' : [0.0313, 0.1883, -0.0041],
        'rot_holster' : [180 + 0.0473, 0.0827, -1.4866],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'Tazer' : {
        
        'type' : 'Prop',
        'rank' : 0,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : null, 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [0.0, 0.0, 0.0],
        'damage_thrown' : [0.0, 0.0, 0.0],
        'range_max' : 0.0,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },

    'Knife' : {
        
        'type' : 'Melee',
        'rank' : 1,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : 'Actor_Action_Swing', 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [5.0, 25.0, 15000.0],
        'damage_thrown' : [2.0, 10.0, 50.0],
        'range_max' : 0.8,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },

    'Baton' : {
        
        'type' : 'Melee',
        'rank' : 1,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : false,
        'rate' : -1.0,
        'reset_time' : 0.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : null,
        'projectile' : null,
        
        'anim_primary' : 'Actor_Action_Swing', 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : null, 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [5.0, 25.0, 15000.0],
        'damage_thrown' : [2.0, 10.0, 50.0],
        'range_max' : 0.8,
        'range_min' : 0.0,
        'clip' : -1,
        'clip_size' : -1,
        
        'pos_hand' :    [-0.18312, 0.00075, 0.00984],
        'rot_hand' :    [4.0, -7.0, 175.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.78, 0.03, 0.03],
        
    },
    
    'Pistol' : {
    
        'type' : 'Firearm',
        'rank' : 3,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : 1.0,
        'reset_time' : 2.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : 'holster_r',
        'projectile' : 'Projectile_Bullet',
        
        'anim_primary' : 'Actor_Action_Pistol', 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : 'Actor_Reload_Pistol', 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Holster_R',
        
        'damage_primary' : [10.0, 5.0, 2500.0],
        'damage_thrown' : [2.0, 10.0, 0.0],
        'range_max' : 15.0,
        'range_min' : 3.0,
        'clip' : 7,
        'clip_size' : 7,
        
        'pos_hand' :    [-0.0491, 0.0726, -0.0048],
        'rot_hand' :    [-180.0, 0.0, 180.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [180.0, -90.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, -0.07, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [90.0, -90.0, 90.0] ],
        'dimensions' :  [0.13, 0.20, 0.02],
        
    },
    
    'SMG' : {
    
        'type' : 'Firearm',
        'rank' : 3,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 2.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : 'holster_r',
        'projectile' : 'Projectile_Bullet',
        
        'anim_primary' : 'Actor_Action_Shoot', 
        'anim_throw' : 'Actor_Throw_Default', 
        'anim_reload' : 'Actor_Reload_Pistol', 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [10.0, 5.0, 2500.0],
        'damage_thrown' : [2.0, 10.0, 0.0],
        'range_max' : 15.0,
        'range_min' : 3.0,
        'clip' : 30,
        'clip_size' : 30,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'Shotgun' : {
    
        'type' : 'Firearm',
        'rank' : 3,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 2.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : 'holster_r',
        'projectile' : 'Projectile_Bullet',
        
        'anim_primary' : 'Actor_Action_Shoot', 
        'anim_throw' : 'Actor_Throw_Large', 
        'anim_reload' : 'Actor_Reload_Pistol', 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [10.0, 5.0, 2500.0],
        'damage_thrown' : [2.0, 10.0, 0.0],
        'range_max' : 15.0,
        'range_min' : 3.0,
        'clip' : 4,
        'clip_size' : 4,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'AssaultRifle' : {
    
        'type' : 'Firearm',
        'rank' : 3,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : 0.1,
        'reset_time' : 2.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : 'holster_r',
        'projectile' : 'Projectile_Bullet',
        
        'anim_primary' : 'Actor_Action_AssaultRifle', 
        'anim_throw' : 'Actor_Throw_Large', 
        'anim_reload' : 'Actor_Reload_Pistol', 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [10.0, 5.0, 2500.0],
        'damage_thrown' : [2.0, 10.0, 0.0],
        'range_max' : 15.0,
        'range_min' : 3.0,
        'clip' : 20,
        'clip_size' : 20,
        
        'pos_hand' :    [-0.0864, 0.1133, -0.0045],
        'rot_hand' :    [-180.0, 0.0, 180.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [-0.0328, 0.1727, 0.0209], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [-3.1054, -1.5251, 0.0578], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
    'SniperRifle' : {
    
        'type' : 'Firearm',
        'rank' : 3,
        
        'right_hand_only' : true,
        'two_handed' : false,
        'can_store' : true,
        'is_stolen' : false,
        'always_ready' : true,
        'rate' : -1.0,
        'reset_time' : 2.0,
        
        'bone' : 'collision_hand_r',
        'attack_bones' : ['worldmodel_right_hand',],
        'holster' : 'holster_r',
        'projectile' : 'Projectile_Bullet',
        
        'anim_primary' : 'Actor_Action_Shoot',
        'anim_throw' : 'Actor_Throw_Large', 
        'anim_reload' : 'Actor_Reload_Pistol', 
        'anim_blendin' : 'Actor_Idle_Blendin', 
        'anim_blendin_override' : null,
        'anim_equip' : 'Actor_Equip_Default',
        
        'damage_primary' : [10.0, 5.0, 2500.0],
        'damage_thrown' : [2.0, 10.0, 0.0],
        'range_max' : 15.0,
        'range_min' : 3.0,
        'clip' : 5,
        'clip_size' : 5,
        
        'pos_hand' :    [0.0, 0.0, 0.0],
        'rot_hand' :    [0.0, 0.0, 0.0],
        'pos_holster' : [0.0, 0.0, 0.0],
        'rot_holster' : [0.0, 0.0, 0.0],
        'pos_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'rot_ik' :      [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ],
        'dimensions' :  [0.0, 0.0, 0.0],
        
    },
    
}   