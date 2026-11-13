# foga-zk-build

FOGA's predicate-pattern proving material (`zk/build/` of the foga checkout), built with
`node prover/build-predicate.mjs` at foga v1.0.7 (commit 60c789a). The ceremony is a
deterministic development setup with a fixed public beacon: the regenerated
`verification_key.json` and `Groth16PredicateVerifier.sol` are byte-identical to the ones
committed in the foga repository. Development keys only, as the build script says; not for
any non-test use.

The zkey (45 MB) is split into parts of 23 MB so that every file fits GitHub's web upload.
`install.sh` reassembles it and copies everything into a foga checkout, then checks the
hashes in `SHA256SUMS`:

```sh
git clone https://github.com/garyyang-finchip/foga-zk-build.git ~/foga-zk-build
bash ~/foga-zk-build/install.sh ~/finchip/finch/foga
```

| File | Purpose |
| --- | --- |
| `kya_predicate_count_v1_final.zkey.part-00`, `.part-01` | the Groth16 proving key, in two parts |
| `kya_predicate_count_v1.wasm`, `witness_calculator.js`, `generate_witness.js` | the circuit's witness generator (`zk/build/kya_predicate_count_v1_js/`) |
| `verification_key.json` | the verification key (identical to the committed one) |
| `SHA256SUMS` | hashes of the installed files, checked by `install.sh` |
