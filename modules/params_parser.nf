include { check_mandatory_parameter; check_optional_parameters; check_parameter_value } from './params_utils.nf'

def default_params(){
    /***************** Setup inputs and channels ************************/
    def params = [:] as nextflow.script.ScriptBinding$ParamsMap
    // Defaults for configurable variables
    params.help = false
    params.version = false
    params.assemblies = false
    params.output_dir = false
    params.kmer_identity = 0.95
    params.snp_threshold = 15
    params.kmer_size = 15
    ska_distance_prefix = distance

    return params
}

def check_params(Map params) { 
    final_params = params
    
    // set up assemblies files
    final_params.assemblies = check_mandatory_parameter(params, 'assemblies')
     
    // set up output directory
    final_params.output_dir = check_mandatory_parameter(params, 'output_dir') - ~/\/$/
      
    return final_params
}