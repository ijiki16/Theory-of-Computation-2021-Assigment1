#!/bin/bash

echo "Start running \"Builder\" tests."
swift ./build.swift <Public\ tests/P1/In\ \(public\)/in00.txt

echo "Start running \"Runner\" tests."
# FILES="/Public\ tests/P2/In\ \(public\)/*"
cd Public\ tests/P2/In\ \(public\)/
FILES='./in*'
for f in $FILES; do
    echo "Processing $f file..."
    # take action on each file. $f store current file name
    # perform some operation with the file
    swift ./../../../run.swift <$f
done

cd ../../..

# ./Public\ tests/P2/Out\ \(public\)/out00.txt <

echo "All tests ended"
