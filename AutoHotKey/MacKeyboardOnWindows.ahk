;=========================================
; AutoHotKey scripts for Corrections/Improvements to Mac keyboard on Windows OS https://github.com/aaronhoffman/autohotkey
;=========================================
; NOTES
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2
SendMode Input

; --------------------------------------------------------------
; media/function keys all mapped to the right option key
; --------------------------------------------------------------

; F13-15, standard windows mapping
F13::SendInput {PrintScreen}
F14::SendInput {ScrollLock}
F15::SendInput {Pause}

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

; Windows+Tab not allowed to be overridden in Windows 8
; Remap Windows + Tab to Alt + Tab.
;# & Tab::AltTab

; Map Windows+Key to ctrl+Key
#.::Send ^.
#s::Send ^s
#a::Send ^a
#c::Send ^c
#v::Send ^v
#x::Send ^x
#o::Send ^o
#f::Send ^f
#z::Send ^z
#y::Send ^y
#t::Send ^t
#w::Send ^w
#q::Send !{F4}

; Windows Arrow to Home/End
#Left::Send {Home}
#Right::Send {End}
#+Left::Send +{Home}
#+Right::Send +{End}

; Option Arrow to Ctrl Arrow
#!Left::SendInput ^{Left}
#!Right::SendInput ^{Right}
#!+Left::SendInput ^+{Left}
#!+Right::SendInput ^+{Right}

; Refresh in chrome
#r::Send ^r

; Address/location bar in chrome (this does not work due to Windows Lock feature)
; #l::^l

; --------------------------------------------------------------
; Correct the numpad keys
; --------------------------------------------------------------

; change = to / (= scancode SC059)
SC059::SC035

; change / to = (this is not working)
; SC035::SC059

; change * to -
NumpadMult::NumpadSub

; change - to *
NumpadSub::NumpadMult

; easy context menu in windows explorer
+Return::SendInput +{F10}
