#!/bin/bash
DIR=/opt/xxnetwork/node-logs
FILE=node.log
GUAC_ERROR=CUD_ERROR
ERROR='ERROR\|FATAL'
LOG_WATCH=/opt/xxnetwork/node_error_reboot.log

inotifywait -m $DIR -e create -e modify |
while read dir ev file; do
#  echo "$(date) EVENT: $ev" >>  $LOG_WATCH
 if [ "$file" = "$FILE" ]; then
  if [ "$ev" = "MODIFY" ]; then
   line=`tail -n1 $DIR/$file`
   if echo $line | grep "$GUAC_ERROR"; then
     echo "$(date) restart server cause of  error: $ERROR in line: $line" >> $LOG_WATCH
     # be carefull that you server doesn´t comes into a restart loop 
     su -c "shutdown -r +1"
   else
     if  echo $line | grep -e "$ERROR"; then
     echo "$(date) error event: $line" >> $LOG_WATCH
     fi
   fi
  fi
 fi

