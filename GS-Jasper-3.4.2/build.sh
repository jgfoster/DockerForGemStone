#!/bin/bash

# GemStone
if [ ! -d gemstone/data ]; then
	mkdir gemstone/data
fi
if [ ! -d gemstone/locks ]; then
	mkdir gemstone/locks
fi
if [ ! -d gemstone/log ]; then
	mkdir gemstone/log
fi
if [ ! -f GemStone.zip ]; then
	curl https://downloads.gemtalksystems.com/pub/GemStone64/3.4.2/GemStone64Bit3.4.2-x86_64.Linux.zip > ../GemStone.zip
fi
if [ ! -f gemstone/product/version.txt ]; then
	chmod -R 777 gemstone/product
	rm -rf gemstone/product
	unzip ../GemStone.zip
	mv GemStone*.Linux gemstone/product
fi
if [ ! -f gemstone/data/extent0.dbf ]; then
	cp gemstone/product/bin/extent0.dbf gemstone/data
	chmod +w gemstone/data/extent0.dbf
fi

# Ace code editor
if [ ! -d ace ]; then
	git clone -b Smalltalk2 https://github.com/jgfoster/ace.git ace
fi
if [ ! -d ace/dist/src-min-noconflict ]; then
	node ace/Makefile.dryice.js --m --nc --target ace/dist
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
cp Jasper/Jasper.sh Jasper/JasperGlobals.gs gemstone
