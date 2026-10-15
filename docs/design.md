# Finite least squares

The library defines squared error on an explicit finite index set. It proves
nonnegativity, a one-point completing-the-square identity, an exact loss-shift
decomposition under zero total residual, and global minimization at a balanced
center. Every sum is finite, and all arithmetic is over mathematical reals.

The minimization theorem assumes zero total residual explicitly. It does not
claim an arbitrary supplied center is an arithmetic mean. Empty datasets are
allowed: all centers then have zero loss. Regression proofs cover empty and
singleton data, the concrete dataset [1, 3], and generic nonnegativity.

This is a downstream Mathlib project, not a fork or an upstream contribution.
Mathlib is pinned to commit 79d0395a1825a6264ad5d269e35e60537518955e,
matching Lean 4.33.0-rc1. The release candidate is pinned to the locally available
compiler; upgrades should be explicit and verified. Dependencies retain their
own licenses.
