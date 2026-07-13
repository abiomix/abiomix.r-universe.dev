# Abiomix R-universe Registry

This repository is the public R-universe registry for Abiomix-maintained and
selected upstream R packages.

- Registry: [`packages.json`](packages.json)
- Package site: `https://abiomix.r-universe.dev`
- Public package development:
  [`abiomix/abiomix-r-open`](https://github.com/abiomix/abiomix-r-open)

## Install Packages

Source packages and the normal platform selection:

```r
options(repos = c(
  abiomix = "https://abiomix.r-universe.dev",
  CRAN = "https://cloud.r-project.org"
))

install.packages("RBCFTools")
```

Ubuntu Noble binary repository:

```r
abiomix_binary_repo <- function() {
  sprintf(
    "https://abiomix.r-universe.dev/bin/linux/noble-%s/%s",
    R.version$arch,
    substr(getRversion(), 1, 3)
  )
}

options(repos = c(
  abiomix = abiomix_binary_repo(),
  CRAN = "https://cran.r-universe.dev/bin/linux/noble-x86_64/4.5"
))
```

Production images use an approved, checksummed snapshot of required packages;
runtime jobs do not install from the live universe.

## Maintainer Setup

R-universe requires its GitHub app to be installed on the `abiomix`
organization after this repository is created:

`https://github.com/apps/r-universe/installations/new`

The manifest resolves Abiomix-maintained packages from their CRAN-shaped
subdirectories in `abiomix-r-open`. Add another `subdir` entry only after that
package is complete and builds from the monorepo default branch.
