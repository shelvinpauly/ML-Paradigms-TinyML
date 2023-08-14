#!/bin/bash

./run_case_prox.sh fedavg shards 100 0.4 16 1
./run_case_prox.sh fedprox shards 100 0.4 16 0
./run_case_prox.sh fedprox shards 100 0.4 16 0.1
./run_case_prox.sh fedprox shards 100 0.4 16 0.5
./run_case_prox.sh fedprox shards 100 0.4 16 1
./run_case_prox.sh fedprox shards 100 0.4 16 2


