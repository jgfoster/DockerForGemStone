#!/bin/bash

if [ -d gemstone/data ]; then
	rm -rf data
fi
if [ -d gemstone/locks ]; then
	rm -rf locks
fi
if [ -d gemstone/log ]; then
	rm -rf log
fi
if [ -d gemstone/product ]; then
	chmod -R 777 product
	rm -rf product
fi
