# Rust project template

## Setup (Clone)

Reset the repository

```bash
rm -rf .git
git init
```

### Library

1) Init cargo project

```bash
cargo init --lib
```

2) Remove the release ci

```bash
rm .github/workflows/release.yaml
```

3) Remove the install command from `justfile`

### Binary

1) Init cargo project

```bash
cargo init --bin
```

2) Create `src/main.rs`.

```bash
echo 'fn main() {}' > src/main.rs
```

### Finally

As a last options you can have a look at [`Cargo.template.toml`](./Cargo.template.toml) to see if any
of the options suit the project.
