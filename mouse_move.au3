; Keep mouse moving

Func _emergencyExit()
	Exit (64)
EndFunc
HotKeySet("{ESCAPE}", "_emergencyExit")

SplashTextOn("","Press escape to exit",100,100,1,1)

; with courtesy of jtapia
While True
	MouseMove(700,250,3)
	MouseMove(1200,250,3)
	MouseMove(700,850,3)
	MouseMove(1200,850,3)
	Sleep (1000)
WEnd