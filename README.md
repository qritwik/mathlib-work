# mathlib-work

Verified finite sums of squares and least-squares identities using Mathlib.

## Run

Install [elan](https://github.com/leanprover/elan), then from this directory:

```sh
lake exe cache get
lake build
python3 scripts/check_proofs.py
```

The toolchain is pinned in `lean-toolchain`; `lake build` checks both the library
and the regression proof module. CI uses the same commands with warnings treated
as errors. No compiled artifacts belong in Git.

## Scope

This is a new, small formalization project, with its guarantees limited to the
precise Lean theorem statements. It does not establish facts about external
software or physical systems. See the source docstrings and `docs/design.md`.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). No license has been selected; no additional
redistribution permissions are granted by this repository.

Mathlib is pinned to an exact revision in `lakefile.toml` and `lake-manifest.json`.
The first build needs network access and several GB of free disk space.
