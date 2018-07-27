export BLOCKSIZE=${BLOCKSIZE:="4k"}
export SIZE=${SIZE:="10Mi"}
export DIRECTORY=${DIRECTORY:="/app"}
export RUNTIME=${RUNTIME:="60"}
export OUTPUT=${OUTPUT:="/app/benchmarks"}


for mode in randread randwrite
do
	for iodepth in 01 02 04 08 16 32 64 128
	do
		sync
		# TODO(arthur0) Investigate log: /proc/sys/vm/drop_caches: Read-only file system
		# echo 3 > /proc/sys/vm/drop_caches
		MYPWD=`pwd`
		echo "========================================="
		echo "Running benchmark $mode with I/O depth of $iodepth and size $SIZE"
		mkdir -p "$OUTPUT"
		export RW=$mode
		export IODEPTH=$iodepth
		# $1 should be a fio file. See ./job-templates
		fio $1 --output-format=json > $OUTPUT/$mode-$iodepth.json
		cd $MYPWD
	done
done

