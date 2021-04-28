#!/bin/bash

# Purpose of this bash script is to take the path to a single compressed fasta file as a command-line
# argument to count total number of sequences and tally the number of SARS-CoV-2 sequences in the dataset from each country (largest to smallest)

# Created on April 4, 2021
# Andrae Ladores - vcladores@dons.usfca.edu

# Simple colors
RED='\033[0;31m'
NC='\033[0m'


# Defensive coding to ensure that a file is selected
if [ $# = 0 ]
then
	echo -e "${RED}WARNING${NC}: Please input necessary file as an argument"
        echo -e "If you want more information, type 'ALL' after inputing the necessary file"
	exit 0
fi

if [ "$2" != "ALL" ]
then
	# Tally up number of sequences from each country and tally from biggest to smallest
	bioawk -c fastx '{print length($seq),$comment}' "$1" | awk '{split($0,a,"|"); print a[5]}' | sort | uniq -c | sort -k1,1nr
	exit 0
fi


# Fix this code, prob need to assign some variables to generalize everything
if [ "$2" = "ALL" ]
then

        bioawk -c fastx '{print length($seq)}' "$1" | wc -l
	echo "The number above is  the total number of sequences"
	echo "########################################################################################################"
	echo "########################################################################################################"
	bioawk -c fastx '{print length($seq),$comment}' "$1" | awk '{split($0,a,"|"); print a[5]}' | sort | uniq -c | sort -k1,1nr
	exit 0
fi
