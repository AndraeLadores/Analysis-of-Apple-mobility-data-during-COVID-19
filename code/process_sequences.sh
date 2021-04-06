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

# 'zcat /blast-db/sars-cov-2-seq-data$/2021...etc | head -n 1000?'

# Then we can use this code to ensure that after "complete genome" the sequences are stated

# `zgrep -A 1 "complete genome" /blast-db/sars-cov2-seq/data$/2021...etc`
 
# Find a way to somehow only capture and then count ONLY the sequences. This is probably
# a regular expression along with pipes!
# Maybe use zgrep -v to find filter out anything but the sequences!
	##`zgrep -v "[^A-Z] ...etc`
	##`zgrep -v "genome$"
	##`zgrep -v "genome$" | wc -l` This seems right, probably put defensive programming here1

# Why are there "N" in the sequences?

# Using zcat to analyze the compressed fasta file, just to take a peek.
cd /
echo "cd /"
echo "Initial cd to top most directory"

cd /blast-db/sars-cov-2-seq-data/
echo "/blast-db/sars-cov-2-seq-data/"
echo "cd to go into blast-db folder"

zcat 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | head
echo "zcat 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz"
echo "This is zcat"

#zgrep -v "genome$" 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | wc -l
#echo "This is how many sequences there are in total"

# Build up on zgrep to somehow get only the country and their total count 
#Find a way to get only the country name!

#echo "This is China numbers"
#zgrep "China" 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | zgrep -v "genome$" |\
#wc -l | sed -E 's/(.*)/China \1/' 

# This gives the same output
# zgrep "China" 2021...etc | bioawk -c fastx '{print $seq}' | wc -l


# figure out how to report and list all the countries with their given number of sequences
country=(China, Iran)
zgrep $country 2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | bioawk -c fastx '{print $seq}' | wc -l | sed -E 's/(.*)/'$country' \1/'


#bioawk -c fastx '{/country/ print $seq}' 2021... | wc -l > country_sequences.txt
