#!/bin/bash

if [ "$#" -ne 6 ]; then
    echo "Usage: ./run_case_prox.sh server partition clientnum joinratio partparam mu"
    echo "    server: fedavg, fedprox"
    echo "    parition: default, shards, dirichlet"
    echo "    clientnum: number of clients, > 0"
    echo "    joinratio: (0, 1]"
    echo "    partparam: If default, classes per client. If shards, shards per"
    echo "               client. If dirichlet, alpha (0, inf)."
    echo "    mu: only for fedprox, regularization coefficient, > 0"
    exit 1
fi

if [ $2 == default ]; then
    partition=-c
elif [ $2 == shards ]; then
    partition=-s
else
    partition=-a
fi

if [ $1 == fedprox ]; then
    mu=--mu
    muv=$6
else
    mu=
    muv=
fi

cd ../../data/utils
python3 run.py -d tiny_imagenet -cn $3 $partition $5
cd ../../src/server
python3 $1.py --model res18 -d tiny_imagenet --visible 0 --verbose 1 -jr $4 -ge 50 -tg 50 -fe 1 $mu $muv --client_cuda 1 --server_cuda 1 --save_fig 0 |& tee prox_run_$1_mu_$6.txt
