#include <Constants.au3>
#include <File.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>
#include <StringConstants.au3>

; Sort Photorec result in folders by extension


# Root folder where files are stored  - don't forget the trailing "\"
$ROOTPATH = "D:\"

# List all folders
$FOLDERLIST = _FileListToArray($ROOTPATH)

# Variable for extension detection _PathSplit
Local $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""

#Loop through folders $i
# $FOLDERLIST[0] contain the number of items in the array
For $i = 1 to $FOLDERLIST[0]
	If StringInStr($FOLDERLIST[$i],"recup_dir.") <> 0 Then
		#ConsoleWrite($FOLDERLIST[$i])
		$aSUBFILELIST = _FileListToArray($ROOTPATH & $FOLDERLIST[$i])
		# loop through file list $j
		For $j = 1 to $aSUBFILELIST[0]
			$FILEPATHSPLIT = _PathSplit($aSUBFILELIST[$j],$sDrive, $sDir, $sFileName, $sExtension)
			$EXTENSION = $FILEPATHSPLIT[$PATH_EXTENSION]
			# Send the file to the extension directory - $FC_CREATEPATH  will create the directory
			FileMove ($ROOTPATH & $FOLDERLIST[$i] & "\" & $aSUBFILELIST[$j], $ROOTPATH & $EXTENSION & "\" & $aSUBFILELIST[$j], $FC_CREATEPATH )
			#ConsoleWrite("Source = " & $ROOTPATH & $FOLDERLIST[$i] & "\" & $aSUBFILELIST[$j] & @CRLF & "DEST = " & $ROOTPATH & $EXTENSION & "\" & $aSUBFILELIST[$j])
		Next
		DirRemove($ROOTPATH & $FOLDERLIST[$i],$DIR_DEFAULT )
	EndIf
Next

MsgBox(0, @ScriptName,"Done")
