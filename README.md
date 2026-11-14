# DEBRIEF-math-erdos306

A DEBRIEF mission record (protocol https://github.com/Nervous-Machine/DEBRIEF) for **The claimed solution of Erdős Problem #306 (sums of unit fractions with semiprime denominators)**.

**Standing.** Certified 2. Accepted 0. Refuted 0. Open gaps 2. The claim and its public artifacts are pinned. On 2026-11-14 Nervous Machine rerun the Lean build at the pinned commit inside a virtual machine, under a rule written down first (cycle 1, logs in `cycles/rerun-1/`): the build passed, the main theorem depends on the three standard axioms only, and the third-party formal statement of the problem, copied word for word from google-deepmind/formal-conjectures, is closed by the claimant's theorem in one step. Nobody has yet read that formal statement against the problem as posed, or the paper; those are the open gaps and the next contributions.

## The problem

Take any positive rational a/b whose denominator b is squarefree. Can a/b always be written as a sum of distinct unit fractions 1/n, each n the product of two distinct primes? The case of three distinct primes with b = 1 was settled by Butler, Erdős and Graham in 2015; many explicit decompositions of 1 are known.

Source: https://www.erdosproblems.com/306 (posed: Erdős and Graham (1980)).

A third-party formalization of the problem statement exists: `FormalConjectures/ErdosProblems/306.lean` in github.com/google-deepmind/formal-conjectures at commit `e028240a61822d970c933f4656f51da025cf200b` (blob `f7940968a96f001791760ef405089a19056c013b`). It is the natural reference for whether a claimant's Lean theorem states this problem.

## The claim

**Shisheng Li**, using GPT-5.6-sol, GPT-6-astra, Claude Opus 5.5 (as listed by the claimant), submitted 2026-09-29 at https://www.erdosproblems.com/forum/thread/306/proof-claims.

The claim is a full solution: every a/b with b squarefree is a finite sum of distinct 1/(pq) with p and q distinct primes. After reducing to small targets it uses one complete bipartite graph between a set of small primes and a tuned set of larger primes, counts subgraphs with the right reciprocal sum modulo one by a finite Fourier sum, and needs only Chebyshev-type bounds on primes. The author reports a Lean formalisation with no sorry and standard axioms only, which also proves the third-party formal-conjectures statement, and notes that version 1 of the arXiv paper still says the formalisation assumed Ramanujan's inequality while the repository now proves the needed bound. The author describes the argument as using Yuren Tang's circle-method framework with a different construction. Tang's own Lean development, deposited on Zenodo, gave a proof conditional on two Rosser–Schoenfeld-type axioms; the Erdős wiki listed it as a candidate full solution with Lean on June 19, 2026.

Artifacts, pinned:

- an arXiv preprint: arXiv:2609.32140v1 "Unit fractions with semiprime denominators: an elementary proof of Erdős Problem #306" (published 2026-09-26, last revised 2026-09-26)
- a public repository: github.com/daizisheng/erdos-306 at commit 1314c9a8bcedaaf986f61fb6cd7129a834116abb (2026-09-29); no licence file; 14 Lean files; no lakefile at the root
- an arXiv preprint: arXiv:2606.15159v2 "Every natural number is a sum of distinct semiprime unit fractions (earlier partial result by the same author)" (published 2026-06-13, last revised 2026-06-17)
- a Zenodo deposit: https://doi.org/10.5281/zenodo.20767390 (Yuren Tang's Lean development, conditional on two stated axioms; cited by the claimant)

Status on the problem page as of 2026-11-14: listed as one proof claim; not marked accepted by the site.

## What is owed

Each open gap is in `ASKS.md` with what closes it and who could act. In order:

1. ~~The Lean development has not been built or kernel-checked by anyone outside the claimant~~ (EG1): resolved by cycle 1. A second rerun by anyone outside Nervous Machine would strengthen it and is welcome.
2. **Do the formal statements say what the problem asks?** (EG2): A reading of the formal statement against the problem as posed, by someone who did not write it.
3. **No independent mathematician has reported reading the proof, and there is no referee report** (EG3): Someone in the field reads it and says, under their name, what holds and what does not.

## Contributing

- **Rerun** (if there is a Lean development): copy `prereg_rerun.yaml`, fill in your predictions, register it with `tools/prereg.py register` from the protocol repository and commit it *before* running anything. Run. Report with the **Rerun report** issue form; it becomes a `rerun` cycle under your name.
- **Read**: a trace (reading guide) does not exist yet. Writing one is itself a `trace` cycle. Once it exists, the **Semantic read** form takes signatures and refusals.
- **Anything else**: open a plain issue.

Rules and templates: https://github.com/Nervous-Machine/DEBRIEF/blob/main/CONTRIBUTING.md. Every contribution is one dated cycle under your own name and goes into `CITATION.cff` and the next release.

## Layout

```
ledger/erdos306.json   the ledger (protocol 0.1.0)
claim.yaml            the pinned claim this record was opened from
SCORECARD.md / ASKS.md  generated from the ledger
prereg_rerun.yaml     the pre-registration of cycle 1 (hashed; copy it for your own rerun)
cycles/               contributed cycles, one file each
```

## Words

This record never calls the claim proved, verified or a theorem. It records what was claimed, what was checked by whom under what rule, and what is still open. Nothing here has standing until a cycle gives it one.
