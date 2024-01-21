_default:
	@just --list

# Checks with clippy
clippy:
	cargo clippy --locked --all-targets -- -Dwarnings

# Checks the formatting
checkfmt:
	cargo fmt --all -- --check

# Check spelling
#
# Requires: `typos-cli`
alias spellcheck := typos
typos:
	typos --format=brief --config="{{justfile_directory()}}/.typos.toml"

# Checks clippy and formatting
lint: clippy checkfmt typos

# Installs binary
install:
	cargo install --path .

# Runs tests
test:
	cargo test --workspace --locked --all-targets

# Test all feature combinations
#
# Requires: `cargo-hack`
test-all:
	cargo hack test --workspace --feature-powerset

# Build rustdoc
docs:
	cargo doc --workspace --all-features --no-deps --document-private-items

# Searches for things which need to be improved
todos:
	rg "(TODO|print(!|ln!)|unwrap\()"

# Cleans build artifacts
clean:
	cargo clean

# Crate compile timings
timings: clean
	cargo build --timings --release

# Runs everything important
all: lint test

alias cic := all

# Checks for outdated dependencies
outdated:
	cargo upgrade --dry-run

update:
	rm Cargo.lock || true
	cargo upgrade
