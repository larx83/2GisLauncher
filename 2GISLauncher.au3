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

;~ ��������� �����..
Run("grym.exe")

;~ ���� ������ ��������� ������� ���������� ����..
While 1
    Sleep(10)
    If WinExists("[REGEXPTITLE:.*\��������� �������������� ������� 2���]") Then
		WinSetTrans("[REGEXPTITLE:.*\��������� �������������� ������� 2���]","", 0)
        WinClose("[REGEXPTITLE:.*\��������� �������������� ������� 2���]")  ; � ��������� ��� ��� ���������
		Sleep(100)
		If Not WinExists("[REGEXPTITLE:.*\��������� �������������� ������� 2���]") Then ExitLoop ; ���� ��� ������� (��������) �� ������� �� ����� ����� ��������
    Else
		if $i = 6000 Then
			MsgBox(0,"msg", "�����������..") ; ����������� - ��������� ������ �������
		EndIf
		$i = $i + 1
    EndIf
WEnd

;~ ���� ������ ��������� ���������� ���������� ����..
While 1
	Sleep(10)
    If WinExists("2���") Then
		WinSetTrans("2���","", 0)
        WinClose("2���") ; � ��������� ��� ��� ���������
		Sleep(1000)
		If Not WinExists("2���") Then
			ExitLoop ; ���� ��� ������� (��������) �� ������� �� ����� ����� ��������
		EndIf
	Else
		if Not WinExists("[REGEXPTITLE:.*\ - 2���]") Then
			Sleep(4000)
			if Not WinExists("[REGEXPTITLE:.*\ - 2���]") Then
				ExitLoop ; ��������� ������� �� ��������� - ��������� ������ �������
			EndIf
		EndIf
    EndIf
WEnd
