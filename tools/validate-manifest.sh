#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
manifest="$root/packages.json"

jq -e '
  type == "array" and
  length > 0 and
  all(.[ ];
    (.package | type == "string" and length > 0) and
    (.url | type == "string" and startswith("https://")) and
    ((has("subdir") | not) or (.subdir | type == "string" and length > 0)) and
    ((has("branch") | not) or (.branch | type == "string" and length > 0))
  )
' "$manifest" >/dev/null

duplicates="$(jq -r '.[].package' "$manifest" | sort | uniq -d)"
if [[ -n "$duplicates" ]]; then
  printf 'duplicate package entries:\n%s\n' "$duplicates" >&2
  exit 1
fi

printf 'validated %s package entries\n' "$(jq 'length' "$manifest")"

