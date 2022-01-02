# error_watch
respond to error in xxnetwork

watch on ERROR in node-err.log (e.g. CUDA_ERROR_NO_DEVICE). 
CUDA_ERROR_NO_DEVICE: the graphic card error can occur after the ubuntu kernel update 
can lead to a standstill of the node

so this is just a workaround. we should find a better way to make the server more robust.

Installation:

cp watchlog.sh to /opt/xxnetwork
cp watchlog.service to /etc/systemd/sytem
sudo systemctl enable watchlog.service
sudo systemctl start watchlog.service

if an error occurs, it is written to /opt/xxnetwork/nod_error_reboot.log
the file has no size limit!

TODO:
- write the logfile as user
- for every error: if the server is offline then start the xxnetwork service
- if necessary restart the server
- send notification (email, telegram ...)

