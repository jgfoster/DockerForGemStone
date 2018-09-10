#!/bin/bash

# Ace code editor
if [ ! -d ace ]; then
	git clone -b Smalltalk2 https://github.com/jgfoster/ace.git ace
fi
if [ ! -d ace/dist/ace-builds ]; then
	node ace/Makefile.dryice.js --m --nc --target ace/dist/ace-builds
fi

# GemStone
if [ ! -d gemstone ]; then
	mkdir gemstone
fi

# WebGS
if [ ! -d WebGS ]; then
	git clone https://github.com/jgfoster/WebGS.git WebGS
fi
cp WebGS/*.gs gemstone

# Jasper
if [ ! -d Jasper ]; then
	git clone https://github.com/jgfoster/Jasper.git Jasper
fi
if [ ! -d Jasper/src/ace-builds ]; then
	cp -R ace/dist/ace-builds Jasper/src/
fi 
if [ ! -d Jasper/dist ]; then
	cd Jasper
	npm run build
	cd ..
fi
cp -R Jasper/dist/ gemstone/htdocs
cp gemstone.sh Jasper/Jasper.sh Jasper/JasperGlobals.gs gemstone
