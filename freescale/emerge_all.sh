#!/bin/sh
for file in *
do
emerge -n $file
done
