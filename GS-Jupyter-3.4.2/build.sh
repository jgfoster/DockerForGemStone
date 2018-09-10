#!/usr/bin/env bash

# GemStone
../GS-CE-Starter-3.4.2/build.sh

# Topaz kernel for Jupyter
if [ ! -d topaz_kernel ]; then
	git clone https://github.com/jgfoster/topaz_kernel.git topaz_kernel
fi
if [ -d gemstone/topaz_kernel ]; then
	rm -rf gemstone/topaz_kernel
fi
cp -r topaz_kernel gemstone/topaz_kernel
cp gemstone.sh gemstone