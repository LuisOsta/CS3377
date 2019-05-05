#!/bin/bash
read -p "Enter x value (integer): " xVal
read -p "Enter y integer (integer): " yVal
addVal=$((xVal + yVal))
subVal=$((xVal - yVal))
mulVal=$((xVal * yVal))
divVal=$((xVal / yVal))
echo "$xVal + $yVal = $addVal"
echo "$xVal - $yVal = $subVal"
echo "$xVal * $yVal = $mulVal"
echo "$xVal / $yVal = $divVal"