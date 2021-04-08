#!/bin/bash

# Purpose of this bash script is to take the path to a single compressed fasta file as a command-line
# argument to count total number of sequences and tally the number of SARS-CoV-2 sequences in the dataset from each country (largest to smallest)

# Created on April 4, 2021
# Andrae Ladores - vcladores@dons.usfca.edu

RED='\033[0;31m'
NC='\033[0m'
GRN='\033[0;92m'

if [ $# = 0 ]
then
	echo -e "${RED}WARNING${NC}: Please input necessary file as an argument"
	exit 1
fi

if [ $# -gt 0 ]
then

	echo -e "${GRN}Success, please wait${NC}"

# Tally up number of sequences from each country and tally from biggest to smallest
bioawk -c fastx '{print length($seq),$comment}' "$1" | awk '{split($0,a,"|"); print a[5]}' | sort | uniq -c | sort -k1,1nr
	exit 1
fi


# Tally up number of sequences from each country and tally from biggest to smallest
# bioawk -c fastx '{print length($seq),$comment}' "$1" | awk '{split($0,a,"|"); print a[5]}' | sort | uniq -c | sort -k1,1nr
