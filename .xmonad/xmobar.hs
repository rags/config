

Config { font = "-*-Fixed-Bold-R-Normal-*-13-*-*-*-*-*-*-*"
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW  L 100 
       , commands = [  Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Swap [] 10
                    , Run Date "%a %b %_d %l:%M" "date" 10
                    , Run StdinReader
                    , Run Battery        [ "--template" , "Batt: <acstatus>"
                                         , "--Low"      , "10"        -- units: %
                                         , "--High"     , "80"        -- units: %
                                         , "--low"      , "darkred"
                                         , "--normal"   , "darkorange"
                                         , "--high"     , "darkgreen"
                                                        
                                         , "--" -- battery specific options
                                                -- discharging status
                                         , "-o"	, "<left>% (<timeleft>)"
                                         -- AC "on" status
                                         , "-O"	, "<fc=#dAA520>Charging</fc>"
                                         -- charged status
                                         , "-i"	, "<fc=#006000>Charged</fc>"
                                         ] 50 
                    , Run Wireless  "wlp3s0"   [ "--template" , "Wifi: <essid> (<quality>%)"
                                               , "--Low"      , "10" 
                                               , "--High"     , "80" 
                                               , "--low"      , "darkred"
                                               , "--normal"   , "darkorange"
                                               , "--high"     , "darkgreen"
                                               ] 10
                    , Run Com  ".xmonad/volume" [] "vol" 10
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{%cpu% | %memory% | %swap% | %wlp3s0wi% | Vol: %vol% | %battery% | <fc=#ee9a00>%date%</fc>"
       }
