python do_configure:append() {
    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}")))

    with open("config.toml", "w") as f:
        f.write("change-id = 116881\n\n")
        config.write(f)
}
