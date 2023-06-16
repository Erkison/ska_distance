include { SKA_SPLIT; SKA_MERGE; SKA_SUMMARY; SKA_DISTANCE } from '../modules/processes.nf' 

workflow SKA {
    take:
        assemblies_ch

    main: 
        SKA_SPLIT(assemblies_ch)

        SKA_MERGE(SKA_SPLIT.out.split_kmer_files.collect())

        SKA_SUMMARY(SKA_MERGE.out.merged_skfs)

        SKA_DISTANCE(SKA_MERGE.out.merged_skfs)

    emit:
        SKA_DISTANCE.out
}