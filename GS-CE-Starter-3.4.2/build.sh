#!/bin/bash

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
	curl https://downloads.gemtalksystems.com/pub/GemStone64/3.4.2/GemStone64Bit3.4.2-x86_64.Linux.zip > GemStone.zip
fi
if [ ! -f gemstone/product/version.txt ]; then
	chmod -R 777 gemstone/product
	rm -rf gemstone/product
	unzip GemStone.zip
	mv GemStone*.Linux gemstone/product
fi
if [ ! -f gemstone/data/extent0.dbf ]; then
	cp gemstone/product/bin/extent0.dbf gemstone/data
	chmod +w gemstone/data/extent0.dbf
fi
docker build -f Dockerfile -t gs342 gemstone
