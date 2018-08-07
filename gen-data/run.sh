# Directory to save the output data (It's not a fio parameter).
export OUTPUT_DIR=${OUTPUT_DIR:="/app/benchmarks"}

# Prefix filename with this directory (see FILENAME).
export DIRECTORY=${DIRECTORY:="/app"}

# The block size in bytes used for I/O units. Default: 4096.
export BLOCK_SIZE=${BLOCK_SIZE:="4096"}

# If value is true, use non-buffered I/O. Default: false.
export DIRECT=${DIRECT:="1"}

# Fio normally makes up a filename based on the job name.
export FILENAME=${FILENAME:="fio-test.bin"}

# Defines how the job issues I/O to the file.
# libaio Linux native asynchronous I/O.
export IO_ENGINE=${IO_ENGINE:="libaio"}

# By default, fio will log an entry in the iops, latency, or bw log
# for every I/O that completes. When writing to the disk log, that
# can quickly grow to a very large size. Setting this option makes
# fio average the each log entry over the specified period of time,
# reducing the resolution of the log.
export LOG_AVG_MSEC=${LOG_AVG_MSEC:="500"}

# Seed the random number generator used for random I/O patterns in a
# predictable way so the pattern is repeatable across runs.
# Default: true.
export RAND_REPEAT=${RAND_REPEAT:="1"}

# Tell fio to terminate processing after the specified period of time.
export RUNTIME=${RUNTIME:="1"}

# How much data are we going to be reading/writing.
export SIZE=${SIZE:="1Mi"}

# If set, fio will run for the duration of the runtime specified
# even if the file(s) are completely read or written
export TIME_BASED=${TIME_BASED:="1"}


# If given, write a bandwidth log for the job.
export WRITE_BW_LOG=${RW}-${BLOCK_SIZE}-${IODEPTH}

# Same as write_bw_log, for I/O submission (e.g., name_slat.x.log),
# completion (e.g., name_clat.x.log), and total (e.g., name_lat.x.log)
# latency files instead
export WRITE_LAT_LOG=${RW}-${BLOCK_SIZE}-${IODEPTH}

# Same as write_bw_log, for I/O submission (e.g., name_slat.x.log),
# completion (e.g., name_clat.x.log), and total (e.g., name_lat.x.log)
# latency files instead
export WRITE_IOPS_LOG=${RW}-${BLOCK_SIZE}-${IODEPTH}

for rw in randread randwrite
do
	for iodepth in 01 02 04 08 16 32
	do
		sync
		MYPWD=`pwd`
		echo "========================================="
		echo "Running benchmark $rw with I/O depth of $iodepth and size $SIZE"
		mkdir -p "$OUTPUT_DIR"
		export RW=$rw
		export IODEPTH=$iodepth
		mkdir -p "$OUTPUT_DIR"
		
		fio $1 --output-format=json > $OUTPUT_DIR/$rw-$iodepth.json
		
		cd $MYPWD
	done
done
