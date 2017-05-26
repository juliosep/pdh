#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <array.au3>
#include <sqlite.au3>
#include <GuiComboBox.au3>

;#AutoIt3Wrapper_Add_Constants=n

_SQLite_Startup()
_SQLite_Open("ipradiosceragon.db3")

Local $sql, $aRows, $j, $k, $iCols, $iRows, $LastSelected, $Estacion, $Enlace, $Ip_1, $Ip_2, $Ip_3, $Ip_4, $busque, $DataBase, $Etiq1, $selec2[4]
#cs
$sql = 'create table T1 (Estacion, Enlace, Ip_1, Ip_2, Ip_3, Ip_4);'
#ce
$sql &= 'insert into T1 values("GUANARE","HATO MODELO COC","10.164.163.246","","10.164.163.248","");'

$sql &= 'insert into T1 values("GUANARE","MESA_DE_CAVACAS","10.166.32.207","10.166.32.208","10.166.32.209","10.166.32.210");'
$sql &= 'insert into T1 values("GUANARE","GUARAMACAL","10.187.152.46","10.187.152.47","10.187.152.44","10.187.152.45");'
#cs
$sql &= 'insert into T1 values("ALTO_BARINAS","AV_AGUSTIN_CODAZZI","10.187.115.20","10.187.115.21","10.187.115.22","10.187.115.23");'
$sql &= 'insert into T1 values("ALTO_BARINAS","CIUDAD VARYNA","10.187.115.24","10.187.115.25","10.187.115.26","10.187.115.27");'
#ce
;_SQLite_Exec(-1, $sql)


$Etiq1 = "IP Procesadas:"
$iCols = $Etiq1
$DataBase = "ipradiosceragon.db3"

#Region ### START Koda GUI section ###
$_1 = GUICreate("MPI Radios PDH Ceragon IP10", 401, 301, 192, 125)
GUICtrlCreateLabel("Hi Camarita! Como estás?", 10, 10,184, 28)
$okbutton = GUICtrlCreateButton("OK", 278, 234, 60, 25)
$idCombo = GUICtrlCreateCombo("", 22, 51, 148, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "ALTO_BARINAS|BARINAS|HATO_PALMASOLA|SABANETA_BAR|GUANARE")
$Combo1 = GUICtrlCreateCombo("Combo1", 216, 51, 161, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))

$Label1 = GUICtrlCreateLabel("Estacion", 24, 24, 76, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel("Enlace", 216, 24, 63, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Label4 = GUICtrlCreateLabel($iCols, 216, 104, 284, 28)

$Label5 = GUICtrlCreateLabel("", 216, 132, 284, 28)
$Label6 = GUICtrlCreateLabel("", 216, 148, 284, 28)
$Label7 = GUICtrlCreateLabel("", 216, 164, 284, 28)
$Label8 = GUICtrlCreateLabel("", 216, 180, 284, 28)

$Combo2 = GUICtrlCreateCombo("", 22, 131, 148, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
;GUICtrlSetData(-1, "ALTO_BARINAS |BARINAS |HATO PALMASOLA|SABANETA |GUANARE")
;_pop_combo2()
$Label3 = GUICtrlCreateLabel("IP Enlace", 24, 104, 84, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

GUICtrlSetState($Combo1, $GUI_DISABLE)
GUICtrlSetState($Combo2, $GUI_DISABLE)
GUICtrlSetState($okbutton, $GUI_DISABLE)

For $k=0 To 3
	$selec2[$k] = ""
Next

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		case $idCombo
			$j = 0
			GUICtrlSetState($Combo1, $GUI_ENABLE)
			GUICtrlSetData($Combo2,"")
			GUICtrlSetState($Combo2, $GUI_DISABLE)
			GUICtrlSetState($okbutton, $GUI_DISABLE)
			$iCols = $Etiq1
			GUICtrlSetData($Label4, $Etiq1)
			GUICtrlSetData($Label5, "")
			GUICtrlSetData($Label6, "")
			GUICtrlSetData($Label7, "")
			GUICtrlSetData($Label8, "")
			$busque = GUICtrlRead($idCombo)
			_pop_combo1()

		case $Combo1
			GUICtrlSetState($Combo2, $GUI_ENABLE)
			$busque = GUICtrlRead($Combo1)
			_pop_combo2()
		case $Combo2
			GUICtrlSetState($okbutton, $GUI_ENABLE)

			$iCols = GUICtrlRead($Combo2)
			GUICtrlSetState($Combo1, $GUI_DISABLE)

		Case $okbutton ;evento de control
			MsgBox(0, "Evento GUI", "Usted presionó OK! " & GUICtrlRead($Combo2))
			_menu_combo2()
			GUICtrlSetState($okbutton, $GUI_DISABLE)
	EndSwitch
WEnd

Func _pop_combo1()
	;MsgBox(0, "OJO", "POP_COMBO1= " & GUICtrlRead($idCombo))
    ;_SQLite_GetTable2d(-1, 'select _rowid_, Enlace from T1 where Estacion = ALTO_BARINAS', $aRows, $iRows, $iCols)
	_SQlite_Query (-1, "SELECT * FROM T1 WHERE Estacion = '" & $busque & "'", $aRows)
	;$iCols = "SELECT * FROM T1 WHERE Estacion = '" & $busque & ".'"
	;_SQlite_Query (-1, "SELECT * FROM T1 WHERE Estacion = 'ALTO_BARINAS'", $aRows)

	;MsgBox(0, "OJO", "POP_COMBO1= " & $iCols)
    ;_arraydisplay($aRows)

    Local $str = '|'

	While _SQLite_FetchData($aRows, $iRows) = $SQLITE_OK
		$str &= $iRows[1] & '|'

	WEnd

    GUICtrlSetData($Combo1, $str)

    $LastSelected = ''

EndFunc   ;==>_pop_combo1

Func _pop_combo2()

	_SQlite_Query (-1, "SELECT * FROM T1 WHERE Enlace = '" & $busque & "'", $aRows)

    Local $str2 = '|'

	While _SQLite_FetchData($aRows, $iRows) = $SQLITE_OK
		If $iRows[2] <> "" Then
			$str2 &= $iRows[2] & '|'
		EndIf
		If $iRows[3] <> "" Then
			$str2 &= $iRows[3] & '|'
		EndIf
		If $iRows[4] <> "" Then
			$str2 &= $iRows[4] & '|'
		EndIf
		If $iRows[5] <> "" Then
			$str2 &= $iRows[5] & '|'
		EndIf
	WEnd

    GUICtrlSetData($Combo2, $str2)

    $LastSelected = ''

EndFunc   ;==>_pop_combo2
Func _menu_combo2()
	Local $i, $h, $bandera
	$str2 = ""
	$selec2[$j] = GUICtrlRead($Combo2)
	$j = $j + 1
	Switch $j
		Case 1
			GUICtrlSetData($Label5, $iCols)
		Case 2
			GUICtrlSetData($Label6, $iCols)
		Case 3
			GUICtrlSetData($Label7, $iCols)
		Case 4
			GUICtrlSetData($Label8, $iCols)
	EndSwitch

	GUICtrlSetData($Combo2, "")

	_SQlite_Query (-1, "SELECT * FROM T1 WHERE Enlace = '" & $busque & "'", $aRows)

    Local $str2 = '|'

	While _SQLite_FetchData($aRows, $iRows) = $SQLITE_OK
		For $i=2 to 5
			$bandera = 0
			For $h=0 to 3
				If $iRows[$i] = $selec2[$h] Then
					$bandera = 1
					ExitLoop
				EndIf
			Next
			if $bandera <> 1 Then
				$str2 &= $iRows[$i] & '|'
			EndIf
		Next
		GUICtrlSetData($Combo2, $str2)
	WEnd
EndFunc   ;==>_menu_combo2