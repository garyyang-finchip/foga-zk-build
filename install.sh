#!/usr/bin/env bash
# Installs FOGA's predicate-pattern proving material into a foga checkout (zk/build/), reassembling the zkey from
# the parts kept in this repository (GitHub's web upload takes files of 25 MB at most).
# Usage: bash install.sh <path to the foga checkout>   e.g. bash install.sh ~/finchip/finch/foga
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
foga="${1:?path to the foga checkout}"
[ -f "$foga/package.json" ] || { echo "not a foga checkout: $foga" >&2; exit 1; }
dest="$foga/zk/build"
mkdir -p "$dest/kya_predicate_count_v1_js"
cat "$here"/kya_predicate_count_v1_final.zkey.part-* > "$dest/kya_predicate_count_v1_final.zkey"
cp "$here/kya_predicate_count_v1.wasm" "$here/witness_calculator.js" "$here/generate_witness.js" "$dest/kya_predicate_count_v1_js/"
cp "$here/verification_key.json" "$dest/verification_key.json"
cd "$foga" && sha256sum -c "$here/SHA256SUMS"
echo "installed into $dest"
