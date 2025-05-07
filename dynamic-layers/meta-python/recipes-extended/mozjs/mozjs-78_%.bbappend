EXTRA_OECONF = " \
    --target=${RUST_TARGET_SYS} \
    --host=${BUILD_SYS} \
    --prefix=${prefix} \
    --libdir=${libdir} \
    --x-includes=${STAGING_INCDIR} \
    --x-libraries=${STAGING_LIBDIR} \
    --without-system-icu \
    --disable-tests --disable-strip --disable-optimize \
    --disable-jemalloc \
    --with-system-icu \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-gold", '--disable-gold', d)} \
    ${JIT} \
"
