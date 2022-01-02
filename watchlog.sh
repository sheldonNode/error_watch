#!/bin/bash
# sudo apt install inotify-tools

DIR=/opt/xxnetwork/node-logs
FILE=node-err.log
ERROR=CUDA_ERROR_NO_DEVICE
LOG_WATCH=/opt/xxnetwork/node_error_reboot.log

inotifywait -m $DIR -e create -e modify |
while read dir ev file; do
#  echo "$(date) EVENT: $ev" >>  $LOG_WATCH
 if [ "$file" = "$FILE" ]; then
  if [ "$ev" = "MODIFY" ]; then
   line=`tail -n1 $DIR/$file`
   if echo $line | grep "$ERROR"; then
     echo "$(date) restart server cause of  error: $ERROR in line: $line" >> $LOG_WATCH
     su -c "reboot"
   else
     echo "$(date) error event: $line" >> $LOG_WATCH
   fi
  fi
 fi
done
