# Create folder structure
mkdir -p "${OUTPUT_DIR}"
mkdir -p "${BIN_DIR}"
mkdir -p "${DATA_DIR}"
mkdir -p "${MODELS_DIR}"
mkdir -p "${LOG_DIR}"

# Install pre-requisites
time bash build-prereq.sh
time bash run-prereq.sh

# Build binary
time bash build_release_binaries.sh

# Download case study data
time gsutil -m cp -r "${DATA_BUCKET}/*" "${DATA_DIR}"

