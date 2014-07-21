#start emacs as server
emacs=`which emacs`
emacsc=`which emacsclient`
ssd=`which start-stop-daemon`
quot='"'
[ -e "$emacs" ] || exit 0

do_start(){
   su - raghunr -c "$ssd -S -q  -x $emacs -- --daemon"
}

do_stop(){
   su - raghunr -c "$emacsc -e ${quot}(progn (save-some-buffers t) (desktop-release-lock) (setq kill-emacs-hook 'nil) (kill-emacs t))${quot}"
   pkill emacs
   
}

do_restart(){
  do_stop
  do_start
}

case "$1" in
     start) do_start;;
     stop)  do_stop;;
     restart|force-reload|reload) do_restart;;
     *) echo "Usage: emacs start|stop|restart|reload|force-reload";;
esac

