HotKeySet("{ESCAPE}", "_emergencyExit")

Func _emergencyExit()
	Exit (64)
EndFunc

;$pixcoord = PixelSearch(800,0,@DesktopWidth,@DesktopHeight,0xDC3545)
$pixfound = 0
While 1
	$pixcoord = PixelSearch(0,0,1920,1080,0xDC3545)
	if @error <> 1 Then
			$pixfound = 1
	EndIf

	if $pixfound =1 then
		MouseMove($pixcoord[0]+1,$pixcoord[1]+1)
		MouseClick("Left")
		$pixfound = 0
		sleep (100)
	EndIf




	sleep (100); avoid infinite loop issues
WEnd
