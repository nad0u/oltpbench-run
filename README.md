# oltpbench-run
## Description
This little bash script is meant to be used with OLTP-Bench project (https://github.com/oltpbenchmark/oltpbench).
It aims to facilitate the executions of several runs given several scale factors in arguments.
This script was written in order to run TPC-C benchmark and therefore will not work with other benchmark, unless you explicitly change the paths, configuration file names and/or result folder names.

## Requirements
As stated, this script is meant to be run for a specific purpose. Therefore, if you want to use is as it is, you need to follow some rules:
* the script itself must be placed next to the `oltpbenchmark` script.
* results folder must be created before running benchmark and be named `results_sX` where X is the scale factor.
* configuration files are named `tpcc_sX_tY_config.xml`, where Y is the number of terminal

## Usage
You can specify several **scale factors** as arguments when running the script. For example: `./oltpbench-run 1 16` will run two benchmark, the first with scale factor 1, the second with scale factor 16.

## Remarks
This script will make 2 runs for each scale factor passed as arguments.
You can and must change the two variables `machine` and `terminal` in the script to suit your needs.
