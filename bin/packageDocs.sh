#!/bin/bash
# Build and package docs and downloads

echo "Making BashKit.zip.."
rm ./download/BashKit.zip
zip --junk-paths ./download/BashKit.zip ./scripts/*

echo "Generating usage.."
./bin/showUsage.sh > ./docs/usage.md
