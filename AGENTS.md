# Abiomix R-universe Registry Agent Guide

- This repository contains the public R-universe registry, not package source.
- Keep `packages.json` valid JSON with one unique entry per R package.
- `package` must exactly match the package's `DESCRIPTION`.
- `url` must be a public Git clone URL. Add `subdir` only for a package below
  the repository root.
- Omit `branch` to follow the repository default branch. Pin a branch or release
  only through an explicit release decision.
- Do not add private Git URLs, credentials, patient data, or internal package
  names.
- Abiomix-maintained packages must declare Sounkou Mahamane Toure as an author
  and Abiomix FZ LLC as `cph` and `fnd`. Registry-only third-party packages keep
  their upstream metadata unchanged.
- Run `bash tools/validate-manifest.sh` before committing.
- The live universe is a development/build service, not the production lock.
