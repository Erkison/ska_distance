# Calculate pairwise distance using SKA

## Local run
```
nextflow run ska_distance/main.nf \
    --assemblies "path/to/assemblies/*.f*a" --output_dir path/to/output/dir \
    --kmer_size 15 --snp_threshold 10 --kmer_identity 0.95 --ska_distance_prefix distance \
    -profile local -resume
```

## MASSIVE run
```
nextflow run ~/js66_scratch/erkison/seroepi/scripts/nextflow/ska_distance/main.nf \
    --assemblies "path/to/assemblies/*.f*a" --output_dir path/to/output/dir \
    --kmer_size 15 --snp_threshold 10 --kmer_identity 0.95 --ska_distance_prefix distance \
    -profile standard -resume
```
