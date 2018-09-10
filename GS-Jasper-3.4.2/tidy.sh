#!/bin/bash

if [ -d ace/dist/src-min-noconflict ]; then
	rm -rf ace/dist/src-min-noconflict
fi
if [ -d Jasper/src/ace-builds ]; then
	rm -rf Jasper/src/ace-builds
fi
if [ -d  Jasper/dist ]; then
	rm -rf  Jasper/dist
fi
if [ -d gemstone ]; then
	rm -rf gemstone
fi
