# nf-imperial-canary
**nf-core config checks for the Imperial College London HPC**

## Usage

To run the checks, clone the repository then run the bash script: -

```
git clone git@github.com:neurogenomics/nf-imperial-canary.git
cd nf-imperial-canary
./run.sh
```

The script will perform the following steps: -

1. Download the latest `imperial.config` file from the nf-core configs repository.
2. Install the latest version of Nextflow in your HPC personal conda environment.
   1. Note: Would prefer the `curl -s https://get.nextflow.io | bash` method, but HPC issues were not allowing this when the scripts were first written on 10/02/2022.
3. Run the config check pipeline with the standard profile, equivalent to `-profile imperial,standard`.  Currently, this pipeline submits one empty job for each major process label used in nf-core pipelines (e.g. process_low, process_medium, etc.) to check correct job sizing.  Additionally, one job will be submitted to test singularity function using a minimal ubuntu docker image (~27 Mb); this is slightly larger than some other minimal Docker images (e.g. alpine, 5 Mb), however it matches more closely the images we typically use for analyses.

If everything completes succesfully, an `OK.txt` file is generated.  The bash script checks the existence of this file to allow downstream action (e.g. e-mail) to be triggered in the future.  

## Future Work

- Add test profile runs for nf-core pipelines (e.g. scflow, cutandrun, rnaseq, etc.) __BRIAN?__  __ALAN?__
- Connect the output logic to an e-mail warning system or similar. __CHRIS__?
- Add another check for `-profile imperial,medbio`.  (Me)


Combiz 10/02/2022
