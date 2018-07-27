
var Dialogue_Trees = {

    'Events' : {
    
        'Hear_Unknown' : {
            'Guard' : "What's that sound?",
            'Civilian' : "What's that sound?",
            },
        'Hear_Walk' : {
            'Guard' : "Who's there?",
            'Civilian' : "Who's there?",
            },
        'Hear_Run' : {
            'Guard' : "Who's that?",
            'Civilian' : "Who's that?",
            },
        'Hear_Shooter' : {
            'Guard' : "Gunshots!",
            'Civilian' : "Gunshots!",
            },
        'Sight_Item' : {
            'Guard' : "What's this doing here?",
            'Civilian' : "What's this doing here?",
            },
        'Sight_Ragdoll' : {
            'Guard' : "We got a man down!",
            'Civilian' : "Someone's dead!",
            },
        'Sight_Pickpocketing' : {
            'Guard' : "Hey! I saw that!",
            },    
        'Sight_BodyDrag' : {
            'Guard' : "Hey! Let go of that body!",
            'Civilian' : "What are you doing with that body?",
            },    
        'Sight_ItemStealer' : {
            'Guard' : "Hey! What are you doing with that?",
            'Civilian' : "Hey! What are you doing with that?",
            },    
        'Sight_MeleeCarry' : {
            'Guard' : "Drop the weapon!",
            'Civilain' : "Don't hurt me!",
            },    
        'Sight_GunCarry' : {
            'Guard' : "Drop the firearm!",
            'Civilian' : "Don't Shoot!",
            },   
        'Sight_Brawler' : {
            'Guard' : "Take this!",
            'Civilian' : "Woah!",
            },
        'Sight_Shooter' : {
            'Guard' : "Die!",
            'Civilian' : "Oh lord!",
            },
        'Sight_Hostile' : {
            'Civilian' : "Have mercy!",
            },
        'Remark_Inappropriate' :  {
            'Guard' : "What are you doing?",
            'Civilian' : "What are you doing?",
            },
        'Remark_Loitering' :  {
            'Guard' : "Get back to work!",
            },
        'Remark_Stalking' :  {
            'Guard' : "What do you want?",
            'Civilian' : "What do you want?",
            },
        'Remark_Staring' :  {
            'Guard' : "What are you looking at?",
            'Civilian' : "What are you looking at?",
            },
        'Remark_ItemThrower_Suspect' : {
            'Guard' : "Did you throw that?",
            'Civilian' : "Did you throw that?",
            },
        'Remark_ItemThrower_Caught' : {
            'Guard' : "What are you doing?",
            'Civilian' : "What are you doing?",
            },
        'Remark_Sneaking_Caught' : {
            'Guard' : "Why are you sneaking around?",
            'Civilian' : "Why are you sneaking around?",
            },
        'Remark_Near_Restricted' : {
            'Guard' : "Sorry sir, this area's restricted.",
            },
        'Remark_Trespassing' : {
            'Guard' : "Leave Immediately!",
            'Civilian' : "You can't be here!",
            },
        'Remark_Murder_Suspect' : {
            'Guard' : "Hey you! Are you responsible for this?",
            'Civilian' : "Hey you! Are you responsible for this?",
            },
        'Remark_Shooter_Suspect' : {
            'Guard' : "Did you do that?",
            'Civilian' : "Did you do that?",
            },
        'Remark_Resisting_Arrest' : {
            'Guard' : "Stop right there!",
            },
        'Remark_Arrest' : {
            'Guard' : "You're under arrest!",
            },
        'Callout_Ragdoll_Drag' : {
            'Guard' : "I'll take care of this.",
            },
        'Callout_Report_Crime' : {
            'Civilian' : "Someone stop that man!",
            },
    
        },

    'Question' : {
    
        'Default' : {#'Location_Trinket' : {
            'Request_A' : [
                "Where can I find the trinket?",
                0.0,
                'Response_A'
                ],
            'Response_A' : [
                "The trinket is on the table outside.",
                2.0,
                'End'
                ],
            'End' : [
                null,
                2.0,
                null
                ],  
            },
        },
        
    'Threaten' : {
    
        'Default' : {#'Threaten_Default' : {
            'Request_A' : [
                "Get down if you don't want to die!",
                0.0,
                'Response_A'
                ],
            'Response_A' : [
                "Please don't hurt me!",
                2.0,
                'End'
                ],
            'End' : [
                null,
                2.0,
                null
                ],    
            },
        },
        
    'Apologize' : {
    
        },
        
    'Follow Me' : {
    
        },

}


#for type in Actor_Dialogue.keys[]:
#    Actor_Dialogue[type].update[Mission_Actor_Dialogue[type]] 