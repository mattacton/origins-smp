#!/bin/bash
# Figure out which mods go to the server
# Remember to unzip the jars first

#for f in `ls -1 *.jar`; do unzip $f -d `basename $f .jar`; done
#for f in `ls -1 "["*`; do unzip "$f" -d `basename "$f" .jar`; done

for f in $(ls -d */); do
    jFile=$(ls "$f/fabric.mod.json")
    if [ $? -eq 1 ]
    then
        continue
    fi
    echo "$f"
    echo "    environment: $(jq .environment $jFile)"
done

