# error_watch
respond to special error in xxnetwork

watch on ERROR in cmix.log (e.g. CUDA_ERROR_NO_DEVICE, CUDA_ERROR_SYSTEM_DRIVER_MISMATCH). 
CUDA_ERROR_NO_DEVICE: the graphic card error can occur after the ubuntu kernel update 
can lead to a standstill of the node

so this is just a workaround. we should find a better way to make the server more robust.

Installation:

sudo apt install inotify-tools

cp watchlog.sh to /opt/xxnetwork

cp watchlog.service to /opt/xxnetwork
sudo ln -s /etc/systemd/sytem/watchlog.service /opt/xxnetwork/watchlog.service

sudo systemctl enable watchlog.service

sudo systemctl start watchlog.service

if an error occurs, it is written to /opt/xxnetwork/nod_error_reboot.log
the file has no size limit!

TODO:
- write the logfile as user
- for every error: if the server is offline then restart the xxnetwork service
- if necessary restart the server
- send notification (email, telegram ...)
- find a better way for automatic restart :-)
- think about pragmatic failover
- when we are going to mainnet, we need a server for testing ;-) (and development)

 
