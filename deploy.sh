#!/bin/bash

STACKLIST=()

cdk bootstrap

echo "How many stacks will you be deploying? (enter 0 if none) "
read STACKNUM

for i in $(eval echo "{1..$STACKNUM}")
do
	echo "Name of Stack $i: "
	read TMP
	STACKLIST+=( $TMP )
done

for STACK in ${STACKLIST[@]}
do
	sleep 2
	echo "How many parameters does $STACK take? (Enter 0 if none) "
	read PARAMS
	
	COMMAND="cdk deploy $STACK"
	if [[ $PARAMS>0 ]]
	then
		for PARAM in $(eval echo "{1..$PARAMS}")
		do
			echo "Enter parameter $PARAM's name (not the value) listed in your CDK code: "
			read NAME
			echo "Enter $NAME's value: "
			read VALUE

			COMMAND+=" --parameters $NAME=$VALUE"
		done
	fi
	sleep 2
	echo "Deploying $STACK"
	sleep 2
	eval $COMMAND
done
