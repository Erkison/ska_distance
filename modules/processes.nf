process SKA_SPLIT {
    tag "Split ${sample_id}"

    input:
        tuple val(sample_id), path(assembly)

    output:
        path("*.skf"), emit: split_kmer_files

    script:
    """
    ska fasta -o ${sample_id} -k ${params.kmer_size} ${assembly} 
    """
}

process SKA_MERGE {
    tag { "Merge .skf files" }

    publishDir "${params.output_dir}/", 
        mode: 'copy',
        pattern: "merged.skf"

    label 'big_resource_req'

    
    input:
    path(skf_files)

    output:
    path("merged.skf"), emit: merged_skfs

    script:
    """
    ska merge ${skf_files} 
    """
}

process SKA_SUMMARY {
    tag { "Summarise" }

    publishDir "${params.output_dir}/", 
        mode: 'copy',
        pattern: "split_kmers_summary.txt"
    
    input:
    path(merged_skfs)

    output:
    path("split_kmers_summary.txt")
    
    script:
    """
    ska summary ${merged_skfs} > split_kmers_summary.txt
    """
}

process SKA_DISTANCE {
    tag "Calculate distance"

    label 'big_resource_req'

    publishDir "${params.output_dir}/", 
        mode: 'copy',
        pattern: "distances.*"

    input:
        path(merged_skfs)

    output:
        path("distances.*")

    script:
    """
    ska distance -s ${params.snp_threshold} -i ${params.kmer_identity} ${merged_skfs}
    """
}