from ...Actor.Actions import *



def HasTarget(own):
    
    return own.target is not None


def NoTarget(own):
    
    return own.target is None


def TargetHostile(own):
    
    return False
        

def TargetInSight(own):
    
    return IsVisible(own, own.event.object)


def TargetNotInSight(own):
    
    return not IsVisible(own, own.event.object)


def TargetLost(own):
    
    if IsVisible(own, own.event.object):#IsVisible(own, own.player_last_pos) and not \
        return True
    
    return False


def HasEquivalentWeapon(own):
    
    return False


def ClipEmpty(own):
    
    return False


def CoverNotInRange(own):
    
    return False


def CoverInRange(own):
    
    return False


def NotInCover(own):
    
    return False


def InCover(own):
    
    return False

