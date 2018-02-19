# Set up variables
BASE="${HOME}/exome-case-study"
BUCKET="gs://deepvariant"
BIN_VERSION="0.5.1"
MODEL_VERSION="0.5.0"
MODEL_CL="181413382"

# Note that we don't specify the CL number for the binary, only the bin version.
#export BIN_BUCKET="${BUCKET}/binaries/DeepVariant/${BIN_VERSION}/DeepVariant-${BIN_VERSION}+cl-*"
#export MODEL_BUCKET="${BUCKET}/models/DeepVariant/${MODEL_VERSION}/DeepVariant-inception_v3-${MODEL_VERSION}+cl-${MODEL_CL}.data-wgs_standard"
export DATA_BUCKET="${BUCKET}/case-study-testdata"

export INPUT_DIR="${BASE}/input"
export BIN_DIR="/root/deepvariant/bazel-bin/deepvariant"
export MODELS_DIR="/tmp/deepvariant"
export MODEL="${MODELS_DIR}/model.ckpt-89046"
export DATA_DIR="${INPUT_DIR}/data"
export REF="${DATA_DIR}/hs37d5.fa.gz"
export BAM="${DATA_DIR}/151002_7001448_0359_AC7F6GANXX_Sample_HG002-EEogPU_v02-KIT-Av5_AGATGTAC_L008.posiSrt.markDup.bam"
export TRUTH_VCF="${DATA_DIR}/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased.vcf.gz"
export TRUTH_BED="${DATA_DIR}/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_noinconsistent.bed"

export N_SHARDS="8"

export OUTPUT_DIR="${BASE}/output"
export EXAMPLES="${OUTPUT_DIR}/HG002.examples.tfrecord@${N_SHARDS}.gz"
export GVCF_TFRECORDS="${OUTPUT_DIR}/HG002.gvcf.tfrecord@${N_SHARDS}.gz"
export CALL_VARIANTS_OUTPUT="${OUTPUT_DIR}/HG002.cvo.tfrecord.gz"
export OUTPUT_VCF="${OUTPUT_DIR}/HG002.output.vcf.gz"
export OUTPUT_GVCF="${OUTPUT_DIR}/HG002.output.g.vcf.gz"
export LOG_DIR="${OUTPUT_DIR}/logs"

export CAPTURE_BED="${DATA_DIR}/agilent_sureselect_human_all_exon_v5_b37_targets.bed"

