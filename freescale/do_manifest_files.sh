#!/bin/sh
for file in */*.ebuild
do
ebuild $file manifest
done
