# nf-imperial-canary

## Usage

To run the checks, first clone the repository then run the bash script: -

```
git clone git@github.com:neurogenomics/nf-imperial-canary.git
cd nf-imperial-canary
./run.sh
```

The script will perform the following steps: -

1. Download the latest `imperial.config` file from the nf-core configs repository.
   1. Note: This is equivalent to `-profile imperial` for these testing purposes.  The `-profile` argument is nf-core pipeline specific, which this config check pipeline is not.
2. Install the latest version of Nextflow in your HPC personal conda environment.
   1. Note: Would prefer the `curl -s https://get.nextflow.io | bash` method, but HPC issues were not allowing this when the scripts were generated on 10/02/2022.
3. Run the config check pipeline.  Currently, this pipeline submits one empty job for each major process label used in nf-core pipelines (e.g. process_low, process_medium, etc.) to check correct job sizing.  Additionally, one job will be submitted to test singularity function.

If everything completes succesfully, a `OK.txt` file is generated.  The bash script checks the existence of this file to trigger downstream action (e.g. canary e-mail).  

## Future Work

- Add test profile runs for nf-core pipelines (e.g. scflow, cutandrun, rnaseq, etc.) __BRIAN?__  __ALAN?__
- Connect the output logic to an e-mail warning system or similar. __CHRIS__?



Combiz 10/02/2022
