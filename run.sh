#!/bin/sh
cat << "EOF"
   ___             __ _           ___                             
  / __\___  _ __  / _(_) __ _    / __\__ _ _ __   __ _ _ __ _   _ 
 / /  / _ \| '_ \| |_| |/ _` |  / /  / _` | '_ \ / _` | '__| | | |
/ /__| (_) | | | |  _| | (_| | / /__| (_| | | | | (_| | |  | |_| |
\____/\___/|_| |_|_| |_|\__, | \____/\__,_|_| |_|\__,_|_|   \__, |
                        |___/                               |___/ 
EOF
printf '   — nf-core config checks for the Imperial College London HPC —\n'

CONFIGURL=https://raw.githubusercontent.com/nf-core/configs/master/conf/imperial.config
CONFIGPATH=./conf/test.config
printf '\n---- DOWNLOADING NF-CORE CONFIG FOR IMPERIAL COLLEGE LONDON\n'
wget -q $CONFIGURL -O $CONFIGPATH
if [[ ! -f $CONFIGPATH ]] ; then
    printf "\nThe file could not be downloaded from $CONFIGURL, aborting.\n"
    exit
else
    printf "Done.  Downloaded the config file to $CONFIGPATH.\n"
fi
printf '\n---- INSTALLING LATEST NEXTFLOW VERSION\n'
module load anaconda3/personal
conda install -yqc bioconda nextflow
printf '\n---- RUNNING IMPERIAL COLLEGE NEXTFLOW NF-CORE CANARY PIPELINE\n'
nextflow run ./main.nf -c $CONFIGPATH
if [[ ! -f OK.txt ]] ; then
    printf "\nERROR: The canary pipeline did not complete succesfully, check logs.\n"
    exit
else
    printf '\nSUCCESS: The canary pipeline completed successfully.\n'
fi

