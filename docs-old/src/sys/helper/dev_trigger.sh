echo ======================================================
echo Running trigger server for syncing files after change.
echo ======================================================
while true; do { echo -e 'HTTP/1.1 200 OK\r\n'; bash -c 'rsync -avzh /vagrant/ /_vagrant/'; } | nc -l $1 -q 2 ; done