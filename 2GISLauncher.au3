#NoTrayIcon
#cs ----------------------------------------------------------------------------
 AutoIt Version: 3.3.8.1
 Author:         myName
 Script Function:
	Template AutoIt script.
#ce ----------------------------------------------------------------------------
Opt("WinDetectHiddenText", 1)

Dim $i
$i = 0

;~ Запускаем карту..
Run("grym.exe")

;~ Ждем минуту появления первого рекламного окна..
While 1
    Sleep(10)
    If WinExists("[REGEXPTITLE:.*\Городская информационная система 2ГИС]") Then
		WinSetTrans("[REGEXPTITLE:.*\Городская информационная система 2ГИС]","", 0)
        WinClose("[REGEXPTITLE:.*\Городская информационная система 2ГИС]")  ; и закрываем его при появлении
		Sleep(100)
		If Not WinExists("[REGEXPTITLE:.*\Городская информационная система 2ГИС]") Then ExitLoop ; если оно исчезло (проверка) то выходим из этого цикла ожидания
    Else
		if $i = 6000 Then
			MsgBox(0,"msg", "недождались..") ; недождались - завершаем работу скрипта
		EndIf
		$i = $i + 1
    EndIf
WEnd

;~ Ждем минуту появления последнего рекламного окна..
While 1
	Sleep(10)
    If WinExists("2ГИС") Then
		WinSetTrans("2ГИС","", 0)
        WinClose("2ГИС") ; и закрываем его при появлении
		Sleep(1000)
		If Not WinExists("2ГИС") Then
			ExitLoop ; если оно исчезло (проверка) то выходим из этого цикла ожидания
		EndIf
	Else
		if Not WinExists("[REGEXPTITLE:.*\ - 2ГИС]") Then
			Sleep(4000)
			if Not WinExists("[REGEXPTITLE:.*\ - 2ГИС]") Then
				ExitLoop ; программа закрыта не корректно - завершаем работу скрипта
			EndIf
		EndIf
    EndIf
WEnd
