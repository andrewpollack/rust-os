RUST_TOOLCHAIN_TARGET=thumbv7em-none-eabihf
OS_ENTRYPOINT=rust_os/Cargo.toml

build:
	cargo build --target ${RUST_TOOLCHAIN_TARGET} --manifest-path=${OS_ENTRYPOINT}

toolchain_add:
	rustup target add ${RUST_TOOLCHAIN_TARGET}
