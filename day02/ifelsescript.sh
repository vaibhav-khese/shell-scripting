#!/bin/bash

<<disclaimer
this script contains if else syntax
disclaimer

read -p "take number : " number

if [[ $number == "1" ]];
then
	echo "True"
else
	echo "False"

fi
