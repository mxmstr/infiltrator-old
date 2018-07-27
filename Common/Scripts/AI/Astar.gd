from bge import logic
from mathutils import *
from math import *


NodeObjects = []
for obj in logic.getCurrentScene().objects:
    if 'Spawn_Node' in obj.name:
        NodeObjects.append(obj)

NodeDict = {}
for obj in NodeObjects:
    
    neighbors = []
    for n in NodeObjects:
        if not n == obj:
            if obj.rayCast(n, None, 0, 'Wall', 0, 1)[0] == None:
                neighbors.append(n.name)
                
    pos = obj.worldPosition.copy()    
    pos.freeze()        
    NodeDict[obj.name] = [pos, neighbors]

        
def GetNearestNode(pos, visible):
    
    nearest = None
       
    for obj in NodeObjects:
        
        if (visible and obj.rayCast(pos, None, 0, 'Wall', 0, 1)[0] == None) or \
            (not visible and obj.rayCast(pos, None, 0, 'Wall', 0, 1)[0] != None):
            if nearest == None:
                nearest = obj
            elif (obj.worldPosition - pos).length < (nearest.worldPosition - pos).length:
                nearest = obj
    
    if nearest == None:
        return None  
    return nearest.name


def GetFarthestNode(pos, visible):
    
    fathest = None
       
    for obj in NodeObjects:
        
        if (visible and obj.rayCast(pos, None, 0, 'Wall', 0, 1)[0] == None) or \
            (not visible and obj.rayCast(pos, None, 0, 'Wall', 0, 1)[0] != None):
            if fathest == None:
                fathest = obj
            elif (obj.worldPosition - pos).length > (fathest.worldPosition - pos).length:
                fathest = obj
      
    return fathest.name
        
    
def FindPath(start, end):
    
    startNode = start#GetNearestNode(start, True)
    endNode = end#GetNearestNode(end, True)

    currentNode = startNode
    newNode = startNode

    currentNeighbors = NodeDict[currentNode][1]

    visitedNodes = [currentNode]
    newPath = [currentNode]

    cost = 0.0
    minCost = None
    newCost = None

    count = 0
    while count < 1000:
        
        for neighbor in currentNeighbors: #iterate through all my neighbors
            
            if not neighbor in visitedNodes: #not in visited nodes
                
                #print([currentNode, neighbor])
                
                estimated = (NodeDict[endNode][0] - NodeDict[neighbor][0]).length  #get estimated distance to goal
                dist_neighbor = (NodeDict[neighbor][0] - NodeDict[currentNode][0]).length
                
                #print(dist_neighbor + estimated)
                
                if minCost == None:
                    newNode = neighbor
                    minCost = cost + dist_neighbor + estimated
                    newCost = dist_neighbor
				
                elif (cost + dist_neighbor + estimated) < minCost: #determine which neighbor has least estimated cost
                    newNode = neighbor
                    minCost = cost + dist_neighbor + estimated
                    newCost = dist_neighbor

        if newNode == endNode:
            newPath.append(newNode)
            break
		
        elif currentNode == newNode: #if node hasn't changed, move backwards
            newPath.pop()
            newNode = newPath[-1]
		
        else:								#else append new node
            newPath.append(newNode)
        
        #cost += newCost
        minCost = None
        newCost = 0.0

        visitedNodes.append(currentNode)

        currentNode = newNode
        currentNeighbors = NodeDict[newNode][1]

        #print(newPath)
        count += 1
    
    
    if count == 1000:
        print('PATH FIND FAILED!!!!!!!!!!!!!!!')
    
#    correctedPath = []
#    for i, node in enumerate(newPath):
#        if i < len(newPath) - 2:
#            pos1 = NodeDict[node][0]
#            pos2 = NodeDict[newPath[i + 2]][0]
#        
#    newPath = correctedPath    
        
#    for i in newPath:
#        node = logic.getCurrentScene().addObject('Node')
#        node.worldPosition = NodeDict[i][0]
#        
    path = [];
    for node in newPath:
        path.append(NodeDict[node][0])
        
    return path


#print(NodeDict['Spawn_Node.118'])
#print(FindPath('Spawn_Node.034', 'Spawn_Node.004'))
#print('END')

