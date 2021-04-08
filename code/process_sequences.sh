#!/bin/bash

# Purpose of this bash script is to take the path to a single compressed fasta file as a command-line
# argument

# Created on April 4, 2021
# Andrae Ladores - vcladores@dons.usfca.edu

# 1 Count total number of sequences in the file
# 2 Tally up the number of SARS-CoV-2 sequences in the
# dataset from each country and sort this output from largest to smallest


# 1: Use zcat to analyze the compressed fasta file to see how we can specifically filter
# only the sequence

# Using zcat to analyze the compressed fasta file, just to take a peek.
cd /
echo "cd /"
echo "Initial cd to top most directory"

cd /blast-db/sars-cov-2-seq-data/
echo "/blast-db/sars-cov-2-seq-data/"
echo "cd to go into blast-db folder"

if [ $# = 0 ]
then
	echo "Please input necessary file as an argument"
	exit 1
fi

# zcat 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | head
# echo "This is zcat results"

# Build up on zgrep to somehow get only the country and their total count 
# Find a way to get only the country name!

#echo "This is China numbers"
#zgrep "China" 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | zgrep -v "genome$" |\
#wc -l | sed -E 's/(.*)/China \1/'

# This gives the same output
# zgrep "China" 2021...etc | bioawk -c fastx '{print $seq}' | wc -l


# figure out how to report and list all the countries with their given number of sequences

##zgrep "USA" 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | bioawk -c fastx '{print $seq}' | wc -l | sed -E 's/(.*)/USA \1/'

##bioawk -c fastx '{print $comment,$seq}' 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | sed -E '/s(|.*|{3})/\1

#bioawk -c fastx '{print $comment,length($seq)}' 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | awk '{print $14}' | head -n 2

bioawk -c fastx '{print length($seq),$comment}' "$1" | awk '{split($0,a,"|"); print a[5]}' | sort | uniq -c | sort -k1,1nr
