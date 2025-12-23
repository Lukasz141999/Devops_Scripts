# Host Availability Checker (Windows)

Python script for checking the availability of hosts using ICMP (ping) on Windows systems.  

The script runs silently in the background without spawning visible CMD windows and saves results to a file.


## Features

- Checks availability of multiple hosts from a text file

- Runs ping commands in the background

- Handles unreachable hosts and ping timeouts

- Ignores empty lines in the input file

- Saves results to an output file

- Safe execution using timeouts to prevent hanging processes



## Input File Format

 - Input file should be in one directory with hosts\_check.exe
 - The `hosts\_list.txt` file should contain one hostname or IP address per line.
 - Empty lines are ignored automatically.

  Example:
  google.com
  192.168.1.1
  server01


## Requirements
 - Windows operating system
 - Python 3.9 or newer
 - ICMP (ping) allowed by firewall


## Usage

  run hosts_check.exe



