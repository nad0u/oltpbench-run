#!/bin/bash

# number of terminals interacting with database
terminals=40
# machine name on which the benchmark is run
machine="large_bs_vm115"

for param in "$@"
do
        # store executed commands
        echo "free -m >> results_s${param}/mem_t${terminals}.txt ; sleep 5 ;" >> results_s${param}/commands.txt
        # keep track of memory usage
        free -m >> results_s${param}/mem_t${terminals}.txt ; sleep 5 ;

        for i in {1..2}
        do
                # run benchmark
                echo "./oltpbenchmark -b tpcc -c config/tpcc_s${param}_t${terminals}_config.xml --execute=true -s 1 -o results_s${param}/tpcc_s${param}_t${terminals}_${i}_sh ; sleep 5 ;" >> results_s${param}/commands.txt
                ./oltpbenchmark -b tpcc -c config/tpcc_s${param}_t${terminals}_config.xml --execute=true -s 1 -o results_s${param}/tpcc_s${param}_t${terminals}_${i}_sh ; sleep 5 ;
        done

        echo "free -m >> results_s${param}/mem_t${terminals}.txt ; sleep 5 ;" >> results_s${param}/commands.txt
        free -m >> results_s${param}/mem_t${terminals}.txt ; sleep 5 ;
        # compress all results files and empty the results folder
        echo "tar -cvf results_${machine}_s${param}_t${terminals}.tar results_s${param}/ ; sleep 5 ;" >> results_s${param}/commands.txt
        tar -cvf results_${machine}_s${param}_t${terminals}.tar results_s${param}/ ; sleep 5 ;
        echo "rm -rf results_s${param}/* ; sleep 5 ;" >> results_s${param}/commands.txt
        rm -rf results_s${param}/* ; sleep 5 ;

done
