#include <File.au3>
#include <Array.au3>
#Include <MsgBoxConstants.au3>

$FOLDER = InputBox("FOLDER PATH","Insert here the full path name" & @CRLF & @CRLF & 'Example (do not insert quotes): C:\users\dad\Desktop\Photo Album\March', Default,"",600 )

$FOLDER_LIST = _FileListToArray($FOLDER)
If @error = 1 Then
    MsgBox($MB_SYSTEMMODAL, "", "Path was invalid.")
	Exit
EndIf

If @error = 4 Then
	MsgBox($MB_SYSTEMMODAL, "", "No file(s) were found.")
	Exit
EndIf

$EXTENSION = InputBox("EXTENSION","Insert here the extesion to add, example .png, .zip or anything else")

If @error > 0 Then
	MsgBox(0,"ERROR CATCHING",@error)
	Exit 66
EndIf

$AREYOUSURE = MsgBox($MB_OKCANCEL,"Do you want to continue?", "NUMBER OF ELEMENTS THAT WILL BE MODIFIED : " & UBound($FOLDER_LIST) -1 )

If $AREYOUSURE <> 1 Then
	Exit $AREYOUSURE
EndIf


For $i = 1 to UBound($FOLDER_LIST) -1
	;MsgBox(0,"LOOP",$FOLDER_LIST[$i])
	FileMove($FOLDER & "\" & $FOLDER_LIST[$i],$FOLDER & "\" & $FOLDER_LIST[$i] & $EXTENSION)

Next

Exit 0
