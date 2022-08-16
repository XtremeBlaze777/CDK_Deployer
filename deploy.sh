#!/bin/bash

cdk bootstrap

echo "How many stacks will you be deploying? (enter \"0\" if none) "
read STACKS

for i in $(eval echo "{1..$STACKS}")
do
	echo "Name of Stack $i: "
	read stacks
done
