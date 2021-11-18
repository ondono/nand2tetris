#!/bin/zsh

for file in ./**/*(.)tst; {echo $file; HardwareSimulator.sh $file}
