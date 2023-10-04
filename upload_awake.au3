;Keep clicking on a webpage to avoid something

HotKeySet("a",_terminate)

Func _terminate()
	exit 64
EndFunc

while 1
	WinActivate("Chrome")
	MouseClick("primary",1101,138,2)
	MouseWheel("down",1)
	sleep(2000)
	MouseWheel("up",1)
	sleep(2000)
	MouseClick("primary",1146,138,2)
	sleep(15000)
WEnd
