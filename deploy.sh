#!/bin/bash

cd src
for element in .
do
    cp -vrfb $element $HOME
done
