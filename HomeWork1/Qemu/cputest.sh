#! /bin/bash

echo "CPU Test!"

PRIMES_UPTO=("2000" "3000")
MAX_TIME=30
TEST_RUNS=5
TEST_CASES=2

for ((i=0; i<$TEST_CASES;i++))
do
	echo "$((i+1))st Test Case"
	for (( j=1; j <=$TEST_RUNS; j++ ))
	do
		echo "Running ${j}st run of Test Case $((i+1))"
		sysbench --test=cpu --cpu-max-prime=${PRIMES_UPTO[$i]} --time=${MAX_TIME} run
		echo "Completed ${j}st run of Test Case $((i+1))"
	done
	echo "Completed $((i+1))st Test Case"
done
