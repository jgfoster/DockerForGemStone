#!/usr/bin/env bash

# GemStone
../GS-CE-Starter-3.4.2/build.sh

# Topaz kernel for Jupyter
if [ ! -d gemstone/topaz_kernel ]; then
	git clone https://github.com/jgfoster/topaz_kernel.git gemstone/topaz_kernel
fi
