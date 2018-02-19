source 'test-variables.sh'

# Call variants
( time python "${BIN_DIR}"/call_variants.zip \
    --outfile "${CALL_VARIANTS_OUTPUT}" \
    --examples "${EXAMPLES}" \
    --checkpoint "${MODEL}" \
    --batch_size 32
) >"${LOG_DIR}/call_variants.log" 2>&1

# Postprocess
( time python "${BIN_DIR}"/postprocess_variants.zip \
    --ref "${REF}" \
    --infile "${CALL_VARIANTS_OUTPUT}" \
    --outfile "${OUTPUT_VCF}"
) >"${LOG_DIR}/postprocess_variants.log" 2>&1

# Happy
UNCOMPRESSED_REF="${OUTPUT_DIR}/hs37d5.fa"

# hap.py cannot read the compressed fa, so uncompress
# into a writable directory and index it.
zcat <"${REF}" >"${UNCOMPRESSED_REF}"
samtools faidx "${UNCOMPRESSED_REF}"

sudo docker pull pkrusche/hap.py
sudo docker run -it \
-v "${DATA_DIR}:${DATA_DIR}" \
-v "${OUTPUT_DIR}:${OUTPUT_DIR}" \
pkrusche/hap.py /opt/hap.py/bin/hap.py \
  "${TRUTH_VCF}" \
  "${OUTPUT_VCF}" \
  --preprocess-truth \
  -f "${TRUTH_BED}" \
  -r "${UNCOMPRESSED_REF}" \
  -o "${OUTPUT_DIR}/happy.output"

