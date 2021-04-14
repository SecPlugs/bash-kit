#!/bin/bash
# Build and package docs and downloads


echo "Making BashKit.zip.."
zip ./download/BashKit.zip ./scripts/*

echo "Generating usage.."
./build/showUsage.sh > ./docs/usage.md
