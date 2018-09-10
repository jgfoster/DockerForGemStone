#!/bin/bash

cd gemstone
if [ -d data ]; then
	rm -rf data
fi
if [ -d locks ]; then
	rm -rf locks
fi
if [ -d log ]; then
	rm -rf log
fi
if [ -d product ]; then
	chmod -R 777 product
	rm -rf product
fi
if [ -d data ]; then
	rm -rf data
fi
if [ -d topaz_kernel ]; then
	rm -rf topaz_kernel
fi
