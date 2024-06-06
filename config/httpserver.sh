#!/usr/bin/bash

#################################
# SIMPLE PYTHON HTTP SERVER
# RUNNING ON WINDOWS
# REQUIRES PYTHON & GIT BASH!
#################################

DIR="/e/0PROGRAMOWANIE Projekty/Python WebServer HTTP/"
PIDPATH="$DIR""config/server.pid"
PORT=80
NOHUPFILE="$DIR""config/nohup.out" # LOGS

start() {
	if [ -e "$PIDPATH" ]; then
		echo -e "\n\tServer IS already running\n"
		exit 1
	else
		echo -e "\nStarting the python server on port $PORT for dir\n$DIR\n"
		nohup python -m http.server $PORT --directory "$DIR" &
		echo $! > "$PIDPATH" # save the PID
		echo "" > "$NOHUPFILE" # clear the log
	fi
}

stop() {
	#kill $(ps -a | grep python | awk '{print $1}')
	if [ -e "$PIDPATH" ]; then
		echo -e "\nStopping the python server\n"
		PIDFILE=$(cat "$PIDPATH")
		kill "$PIDFILE"
		rm "$PIDPATH"
	else
		echo -e "\n\tServer is NOT running\n"
		exit 1
	fi
}

case "$1" in 
    start)
	   start
	   ;;
    stop)
	   stop
	   ;;
    restart)
	   stop
	   start
	   ;;
    status)
		if [ -e "$PIDPATH" ]; then
			PIDFILE=$(cat "$PIDPATH")
			RESULT=$(ps -a | grep "$PIDFILE")
			
			echo -e "\nStatus of the server:\n"
			echo -e "PID: $PIDFILE"
			echo -e "FOUND PROCESS:\n$RESULT"
			#PID=$(ps aux | grep python | awk '{print $1}')
		else
			echo -e "\n\tServer is NOT running\n"
			exit 1
		fi
       ;;
    *)
       echo "Usage: $0 {start | stop | status | restart}"
esac

exit 0 
