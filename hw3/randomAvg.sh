#!/bin/bash
valOne=$((RANDOM % 30 - 5))

if [ $valOne -gt 10 ]
then
    echo "High Average"
else
    echo "Low Average"
fi