#!/usr/bin/env nextflow
/*
========================================================================================
    nf-imperial-canary
========================================================================================
    Github : https://github.com/neurogenomics/nf-imperial-canary
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl=2

process check_process_low {

    label 'process_low'

    script:
      """
      echo "OK"
      """
}

process check_process_medium {

    label 'process_medium'

    script:
      """
      echo "OK"
      """
}

process check_process_high {

    label 'process_high'

    script:
      """
      echo "OK"
      """
}

process check_process_long {

    label 'process_long'

    script:
      """
      echo "OK"
      """
}

process check_process_high_memory {

    label 'process_high_memory'

    script:
      """
      echo "OK"
      """
}

process check_singularity {

    label 'process_low'
    container 'ubuntu:18.04'

    script:
      """
      echo "OK"
      """
}

workflow {
    check_process_low()
    check_process_medium()
    check_process_high()
    check_process_long()
    check_process_high_memory()
    check_singularity()
}

workflow.onComplete {
    println "Execution status: ${ workflow.success ? 'OK' : 'failed' }"
    if ( workflow.success ) {
        def newFile = new File("OK.txt")
        newFile.write("Workflow completed successfully")
    }
}