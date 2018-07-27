from bge import logic
from mathutils import Vector
from Actor_Events import *



def Player_NearItemTable(player):
        
        sensor = player.sensors['Collision_Area']
        return sensor.positive and sensor.hitObject['Area'] == 'ItemTable'