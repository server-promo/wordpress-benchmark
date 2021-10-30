#!/bin/bash

function bench() {
  OUTPUT_FILE="$1"
  CONCURRENCY="$2"
  hey -z 60s -c "${CONCURRENCY}" -o csv http://127.0.0.1:8081 >> "${OUTPUT_FILE}"
}

function usage() {
	returnCode="$1"
	echo
	echo -e "Usage: 
	$ME [-out_c1] [-out_c50] [-h]"
	echo -e "Options:
	[-s]\\t\\t output file for concurrency 1
  [-m]\\t\\t output file for concurrency 50
	[-h]\\t\\t displays help (this message)"
	echo
	exit "$returnCode"
}

function main() {
  OUTPUT_FILE_C1=''
  OUTPUT_FILE_C50=''

  get_opts "$@"

  if [[ $OUTPUT_FILE_C1 ]]; then
	  sep="--------------------------------------------------------";

	  echo "${sep}";
	  echo "Running benchmark, concurrency 1 ...";
	  echo "${sep}";

	  bench "${OUTPUT_FILE_C1}" "1";

	  echo "${sep}";
	  echo "Completed benchmarking";
	  echo "${sep}";
  fi

  if [[ $OUTPUT_FILE_C50 ]]; then
    sep="--------------------------------------------------------";

    echo "${sep}";
    echo "Running benchmark, concurrency 50 ...";
    echo "${sep}";

    bench "${OUTPUT_FILE_C50}" "50";

    echo "${sep}";
    echo "Completed benchmarking";
    echo "${sep}";
  fi
}

function get_opts() {
  while builtin getopts "s:m:h" opt "${@}"; do
  	case $opt in
  	s)
  		OUTPUT_FILE_C1="$OPTARG"
  		;;
  	m)
  		OUTPUT_FILE_C50="$OPTARG"
  		;;
  	h)
  		usage 0
  		;;
  	*)
  		usage 1
  		;;
  	esac
  done
}

docker-compose up -d
sleep 10

main "$@"

docker-compose down
