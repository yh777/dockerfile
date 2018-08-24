#!/bin/bash
cd /data

echo -e "Starting the $TARGET ...\c"

STDOUT_FILE="logs/out.txt"
BITS=`java -version 2>&1 | grep -i 64-bit`
if [ -n "$BITS" ]; then
    JAVA_MEM_OPTS=" -server -Xmx1g -Xms1g -Xmn192m -XX:PermSize=128m -Xss256k -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSCompactAtFullCollection -XX:LargePageSizeInBytes=128m -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=70 "
else
    JAVA_MEM_OPTS=" -server -Xms1g -Xmx1g -XX:PermSize=128m -XX:SurvivorRatio=2 -XX:+UseParallelGC "
fi
JAVA_OPTS=" -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true "
java $JAVA_OPTS $JAVA_MEM_OPTS -jar $TARGET >> $STDOUT_FILE 2>&1 

sleep 3
PIDS=`ps -ef | grep java | grep "$TARGET" | awk '{print $2}'`
echo "PID: $PIDS"

tail -f $STDOUT_FILE


