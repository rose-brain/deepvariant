source 'train-variables.sh'

# Make examples with labels
( time seq 0 $((N_SHARDS-1)) | \
  parallel --halt 2 --joblog "${LOG_DIR}/log" --res "${LOG_DIR}" \
    python "${BIN_DIR}"/make_examples.zip \
      --mode training \
      --ref "${REF}" \
      --reads "${BAM}" \
      --confident_regions "${TRUTH_BED}" \
      --truth_variants "${TRUTH_VCF}" \
      --examples "${EXAMPLES}" \
      --task {}
) >"${LOG_DIR}/make_examples.log" 2>&1

# Train
python "${BIN_DIR}"/model_train.zip \
--dataset_config_pbtxt ${OUTPUT_DIR}/data.pbtxt \
--start_from_checkpoint $MODEL \
--batch_size 16 \
--alsologtostderr
