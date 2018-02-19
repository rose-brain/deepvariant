source 'test-variables.sh'

# Make folders
mkdir -p "${OUTPUT_DIR}"
mkdir -p "${BIN_DIR}"
mkdir -p "${DATA_DIR}"
mkdir -p "${MODELS_DIR}"
mkdir -p "${LOG_DIR}"

# Pull data
time gsutil -m cp -r "${DATA_BUCKET}/*" "${DATA_DIR}"
