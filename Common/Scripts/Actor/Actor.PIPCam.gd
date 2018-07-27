extends Node

var camera = null
var timer = null


func _ready():
	
	pass
	
	
func RenderPIPCam():
	
	if camera != null:
		pass
#		RenderToTexture(
#			Globals.Scene_UI.objects['PIP_Cam_Display'], 
#			own.pip_cam.children[0], 
#			'Screen',
#			0
#			)
				  
#		if GetTimer(own, 'PIP').Tick():
#			ChangePIPCam(own, None)
	
	
func ChangePIPCam(newCam, duration=0.0):
	
	if camera != newCam:
#		if newCam  != null:
#			Globals.Scene_UI.objects['PIP_Cam_Display'].visible = 1
#			SetTimer(own, 'PIP', duration)
#		else:
#			Globals.Scene_UI.objects['PIP_Cam_Display'].visible = 0	
		
		camera = newCam


func _process(delta):
	
	RenderPIPCam()