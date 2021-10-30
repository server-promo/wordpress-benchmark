# WordPress benchmark

Bash Script which:
1) start WordPress in docker with default config (apache2, php 8.0, mysql 8.0, WordPress 5.8.1) 
2) run 2 benchmark (with 1 and 50 workers), default strategy (open “Hello, World!” page)

Contents:

- [Requirements](#requirements)
- [Usage](#usage)

## Requirements

* __GNU/Linux__
* [Bash](https://www.gnu.org/software/bash/)
* [curl](https://curl.haxx.se/)
* [Hey](https://github.com/rakyll/hey)
* [Docker](https://www.docker.com/)
* [Docker-compose](https://docs.docker.com/compose/)

These Ubuntu packages should be installed:

	apt-get install bash curl hey docker docker-compose

## Usage

```
bash benchmark.sh -s "/root/benchnark/wordpress-benchmark/wp_out_c1.csv" -m "/root/benchnark/wordpress-benchmark/wp_out_c50.csv"
```

## Analyze

You should use [Hey HDR](https://github.com/asoorm/hey-hdr) for calculate different measures (max/mean response time, total num of requests, etc)