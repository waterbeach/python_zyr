#!/bin/bash


find ./target/classes -name "*.xml"|xargs rm -f


#export CLASSPATH=$CURR_DIR/lib:$CURR_DIR:$JAVA_HOME/lib:$JAVA_HOME/jre/lib

tmp='./target/classes':$tmp
tmp='./target/populaross-0.0.1-SNAPSHOT-jar-with-dependencies-without-resources/*':$tmp
tmp='./bin/resources':$tmp
CLASSPATH=$tmp:$CLASSPATH


echo $CLASSPATH
JVM_ARGS="-Xmn98m -Xmx1024m -Xms512m -XX:NewRatio=4 -XX:SurvivorRatio=4 -XX:MaxTenuringThreshold=2"
java $JVM_ARGS -classpath $CLASSPATH com.ossean.populaross.main.UpdateLanguage >>log/updatelanguage.log 2>&1 &