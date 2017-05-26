ceripdiez()

func ceripdiez()
Sleep(1000)
MouseClick("left",96,219,1)
Send("{F6}") ; Pant1 Principal

Sleep(1000)
MouseClick("left",12,219,1)
Sleep(1000)
MouseClick("left",96,237,1)
Sleep(1000)
Send("{F6}") ; Pant2 Alarmas

Sleep(1000)
MouseClick("left",13,299,1)
Sleep(1000)
MouseClick("left",30,320,1)
Sleep(1000)
MouseClick("left",113,337,1)
Sleep(1000)
Send("{F6}") ; Pant3 Unit parameters1


Sleep(2500)
;Send("{PGDN}")
MouseClick("left",1012,547,2)
Sleep(3000)
Send("{F6}") ; Pant4 parameters2

Sleep(2500)
MouseClick("left",109,376,1)
Sleep(2500)
Send("{F6}") ; Pant5 Management

Sleep(1000)
MouseClick("left",109,418,1)
Sleep(2500)
Send("{F6}") ; Pant6 Licese

Sleep(1000)
MouseClick("left",31,539,1)
Sleep(125)
MouseClick("left",109,558,1)
Sleep(1000)
Send("{F6}") ; Pant7 Switch configuration

Sleep(1000)
MouseClick("left",230,552,3)
Sleep(1500)
MouseClick("left",31,427,1)
Sleep(1000)
MouseClick("left",109,444,1)
Sleep(2000)
; WinWaitActive("Titulo")
Send("{F6}") ; Pant8 Radio parameters

Sleep(2000)
MouseClick("left",109,505,1)
Sleep(6500)
Send("{F6}") ; Pant9 MRMC

Sleep(1000)
MouseClick("left",230,552,2)
Sleep(1000)
MouseClick("left",30,448,1)
Sleep(2000)
MouseClick("left",109,465,1)
Sleep(4000)
Send("{F6}") ; Pant10 Ethernet ports

Sleep(1000)
MouseClick("left",230,552,2)
Sleep(1000)
MouseClick("left",31,487,1)
Sleep(1000)
MouseClick("left",109,506,1)
Sleep(1000)
Send("{F6}") ; Pant11 E1s

Sleep(1000)


endfunc