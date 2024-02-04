#! /bin/bash

echo "Fileio Test"

TEST_MODE=("rndwr" "seqwr")
MAX_TIME=30
TEST_RUNS=5
TEST_CASES=2

for ((i=0; i<$TEST_CASES; i++))
do
	echo "$((i+1))st Test Case"
	for (( j=1; j <=$TEST_RUNS; j++ ))
	do
		echo "Running ${j}st run of Test Case $((i+1))"
        sysbench --test=fileio --file-test-mode=${TEST_MODE[i]} --time=${MAX_TIME} cleanup
		sysbench --test=fileio --file-test-mode=${TEST_MODE[i]} --time=${MAX_TIME} prepare
		sysbench --test=fileio --file-test-mode=${TEST_MODE[i]} --time=${MAX_TIME} run
		echo "Completed ${j}st run of Test Case $((i+1))"
	done
	echo "Completed $((i+1))st Test Case"
done