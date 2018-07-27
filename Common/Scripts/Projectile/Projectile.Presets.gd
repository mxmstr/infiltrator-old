
var Projectile_Presets = {

    'Bullet' : {
    
        'hitscan' : 0.0,
        'lifetime' : 5.0,
        'face_camera' : false,
        
        'linear_velocity' : [0, 50, 0],
        'angular_velocity' : [0, 0, 0],
        'rand_linear' : [0, 0, 0],
        'rand_angular' : [0, 0, 0],
        'd_loc' : [0, 0, 0],
        'd_rot' : [0, 0, 0],
        'rand_loc' : [0, 0, 0],
        'rand_rot' : [0, 0, 0],
        
        'collisions' : {
        
            'Wall' : 'End',
            'actor_collision' : 'DamageActor',
        
            },
        
        },

    'Laser' : {
    
        'hitscan' : 2.5,
        'lifetime' : 0.0,
        'face_camera' : false,
        
        'linear_velocity' : [0, 0, 0],
        'angular_velocity' : [0, 0, 0],
        'rand_linear' : [0, 0, 0],
        'rand_angular' : [0, 0, 0],
        'd_loc' : [0, 0, 0],
        'd_rot' : [0, 0, 0],
        'rand_loc' : [0, 0, 0],
        'rand_rot' : [0, 0, 0],
        
        'collisions' : {
        
            'Wall' : 'ApplyLaser',
            'actor_collision' : 'ApplyLaser',
        
            },
        
        },
        
    'Smoke_Laser' : {
    
        'hitscan' : 0.0,
        'lifetime' : 2.0,
        'face_camera' : true,
        
        'linear_velocity' : [0, 0, 0],
        'angular_velocity' : [0, 0, 0],
        'rand_linear' : [0, 0, 0],
        'rand_angular' : [0, 0, 0],
        'd_loc' : [0, 0, 0.005],
        'd_rot' : [0, 0, 0],
        'rand_loc' : [0.001, 0.001, 0],
        'rand_rot' : [0, 0, 0],
    
        'collisions' : {
                
            },
        
        },    

    }