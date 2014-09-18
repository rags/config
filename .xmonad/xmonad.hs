 import XMonad
 import XMonad.Util.EZConfig
 import XMonad.Util.Run
 import Text.Printf
 
 myKeys = let 
     masterAudio = "amixer -D pulse set Master "
     brightness = "xbacklight -steps 10 -%s 10"
                            in [
         ("M-l", spawn "xflock4") -- Super+L to lock
        , ("<XF86AudioMute>", spawn $ masterAudio ++ "toggle")
        , ("<XF86AudioRaiseVolume>", spawn $ masterAudio ++ "10%+ unmute")
        , ("<XF86AudioLowerVolume>", spawn $ masterAudio ++ "10%- unmute")
        , ("<XF86MonBrightnessUp>", spawn $ printf brightness "inc") 
        , ("<XF86MonBrightnessDown>", spawn $ printf brightness "dec") ]

 main = xmonad $ defaultConfig
        { terminal    = "urxvt"
        , modMask     = mod4Mask -- Super key is mod
        , borderWidth = 3
        } `additionalKeysP` myKeys
