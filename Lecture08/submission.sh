#!/bin/bash
#$ -cwd
#$ -N ArrayJob
#$ -t 1-100
#$ -l h_rt=00:10:00
#$ -l h_rss=1G
#$ -o MyResults.$TASK_ID.o
#$ -e MyResults.$TASK_ID.e

splitdir=${HOME}/testing_eddie/split_reads_directory
./myanalysisprogram.sh ${splitdir}/reads-${SGE_TASK_ID}
