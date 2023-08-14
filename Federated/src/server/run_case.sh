#!/bin/bash

if [ "$#" -ne 7 ]; then
    echo "Usage: ./run_case.sh server partition clientnum joinratio partparam partvar equalweight"
    echo "    server: fedavg, fedprox"
    echo "    parition: default, shards, dirichlet"
    echo "    clientnum: number of clients, > 0"
    echo "    joinratio: (0, 1]"
    echo "    partparam: If default, classes per client. If shards, shards per"
    echo "               client. If dirichlet, alpha (0, inf)."
    echo "    partvar: Only applies for shards, the variance in shards per client"
    echo "    equalweight: 0, 1"
    exit 1
fi

if [ $2 == default ]; then
    partition=-c
elif [ $2 == shards ]; then
    partition=-s
else
    partition=-a
fi

cd ../../data/utils
python3 run.py -d tiny_imagenet -cn $3 $partition $5 -sv $6
cd ../../src/server
python3 $1.py --model res18 -d tiny_imagenet --visible 0 -jr $4 -ge 50 -tg 50 -fe 1 -ew $7 --client_cuda 1 --server_cuda 1 --save_fig 1 --fig_name ti_jr_$4_cn_$3_$2_$5v$6_ew_$7 --fig_title $1_jr_$4_cn_$3_$2_$5v$6_ew_$7
