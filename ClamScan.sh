#!/bin/bash
LOGFILE="/var/log/clamav/clamav.log";
DIRTOSCAN="/";
for S in ${DIRTOSCAN}; do
DIRSIZE=$(du -sh "$S" 2>/dev/null | cut -f1);
echo "Starting a weekly scan of "$S" directory.
Amount of data to be scanned is "$DIRSIZE".";
echo "______________CLAMAV SCAN______________" >>"$LOGFILE";
/bin/date >> "$LOGFILE";
echo "Directory scan: "$S".
Amount of data to be scanned is "$DIRSIZE"." >> "$LOGFILE";
clamdscan -m -i "$S" >> "$LOGFILE";
echo "Scan complete"
done
