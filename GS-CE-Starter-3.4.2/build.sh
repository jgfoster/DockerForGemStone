#!/bin/bash

if [ ! -f gemstone/product/version.txt ]; then
	chmod -R 777 gemstone/product
	rm -rf gemstone/product
	curl https://downloads.gemtalksystems.com/pub/GemStone64/3.4.2/GemStone64Bit3.4.2-x86_64.Linux.zip > GemStone.zip
	unzip GemStone.zip
	mv GemStone*.Linux gemstone/product
	rm GemStone.zip
	cp gemstone/product/bin/extent0.dbf gemstone/data
	chmod +w gemstone/data/extent0.dbf
fi

docker build .
