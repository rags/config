 import XMonad
 import XMonad.Util.EZConfig
 import XMonad.Util.Run
 import Text.Printf
 import XMonad.Hooks.DynamicLog
 
 myKeys = let 
     masterAudio = "amixer -D pulse set Master "
     brightness = "xbacklight -steps 10 -%s 10"
                            in [
         ("C-M-l", spawn "xflock4") -- Super+L to lock
        , ("<XF86AudioMute>", spawn $ masterAudio ++ "toggle")
        , ("<XF86AudioRaiseVolume>", spawn $ masterAudio ++ "10%+ unmute")
        , ("<XF86AudioLowerVolume>", spawn $ masterAudio ++ "10%- unmute")
        , ("<XF86MonBrightnessUp>", spawn $ printf brightness "inc") 
        , ("<XF86MonBrightnessDown>", spawn $ printf brightness "dec") ]

 myConfig = defaultConfig { terminal    = "urxvt"
                          , modMask     = mod4Mask -- Super key is mod
                          , borderWidth = 3
                          } `additionalKeysP` myKeys
 -- Command to launch the bar.
 myBar = "xmobar ~/.xmonad/xmobar.hs"

 -- Custom PP, configure it as you like. It determines what is being written to the bar.
 myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

 -- Key binding to toggle the gap for the bar.
 toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

 main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
