#!/bin/bash
if ! git diff --exit-code $1 
then
git add $1
git commit -m "Update to $1"  $1
git push
fi
