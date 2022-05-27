RUST_TOOLCHAIN_TARGET=x86_64-rust_os.json
OS_ENTRYPOINT=Cargo.toml

run:
	cargo run

build:
	cargo build

toolchain_add:
	rustup target add ${RUST_TOOLCHAIN_TARGET}

nightly:
	rustup override set nightly

stable:
	rustup override set stable

bootimage_install:
	cargo install bootimage

bootimage:
	cargo bootimage
