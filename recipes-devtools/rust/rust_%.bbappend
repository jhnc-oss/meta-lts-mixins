# Override scarthgap default of "-fcanon-prefix-map" as it seems to
# now cause issues with rust-llvm as of Rust 1.87.  master branch
# did not see this as the default value changed to the below before
# the upgrade to Rust 1.86.
DEBUG_PREFIX_MAP = "\
 -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
 -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
 -ffile-prefix-map=${STAGING_DIR_HOST}= \
 -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
"
