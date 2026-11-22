# DEBRIEF-math-erdos306

A DEBRIEF mission record (protocol https://github.com/Nervous-Machine/DEBRIEF) for **The claimed solution of Erdős Problem #306 (sums of unit fractions with semiprime denominators)**.

This claim is on the public claims board, https://math-board.nervousmachine.com, which shows its stage, who has contributed, and what it needs next.

<!-- standing:begin -->
**Standing, 17 Nov 2026.** Stage: Reading guide written. Needs next: Do the formal statements say what the problem asks? ([what would close it](ASKS.md)).

| certified | accepted | refuted | open gaps | cycles filed | last cycle |
|---|---|---|---|---|---|
| 2 | 0 | 0 | 2 | 3 | 17 Nov 2026 |

| | |
|---|---|
| checked by machine | Linmiao Xu, Nervous Machine |
| read by a person | nobody yet; [reading guide](trace/DEFINITIONAL-TRACE.md) |
| elsewhere | [DeepMind formal-conjectures](https://github.com/google-deepmind/formal-conjectures/blob/6751c0f043985ac6647db28a45a63afdf21acffe/FormalConjectures/ErdosProblems/306.lean): solved, proof linked · [erdosproblems.com](https://www.erdosproblems.com/): open |
| related | — |
| tooling | GPT-5.6 Sol, GPT-6 Astra, Claude Opus 5.5 · tier: unknown (stated by the claimant: three models named, no tier; all three were public by the date submitted) |

Rendered from `ledger/` at regeneration; the full record is `SCORECARD.md`, what is owed is `ASKS.md`. Standing words: 2 certified.
<!-- standing:end -->

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

Status on the problem page as of 2026-11-14: listed as one proof claim; not marked accepted by the site. Google DeepMind's formal-conjectures file for the problem, at the commit pinned here, is tagged `research solved`, cites Li's paper and links a Lean proof by Linmiao Xu that is, by its own README, a port of Li's development. That tag records that a machine-checked proof of the formal statement exists; it is not a human reading of the statement against the problem as posed.

## What is owed

Each open gap is in `ASKS.md` with what closes it and who could act. In order:

1. ~~The Lean development has not been built or kernel-checked by anyone outside the claimant~~ (EG1): resolved by cycle 1. A second rerun by anyone outside Nervous Machine would strengthen it and is welcome.
2. **Do the formal statements say what the problem asks?** (EG2): A reading of the formal statement against the problem as posed, by someone who did not write it.
3. **No independent mathematician has reported reading the proof, and there is no referee report** (EG3): Someone in the field reads it and says, under their name, what holds and what does not.

## Contributing

- **Rerun** (if there is a Lean development): copy `prereg_rerun.yaml`, fill in your predictions, register it with `tools/prereg.py register` from the protocol repository and commit it *before* running anything. Run. Report with the **Rerun report** issue form; it becomes a `rerun` cycle under your name.
- **Read**: the reading guide is `trace/DEFINITIONAL-TRACE.md` (cycle 2). It quotes the problem and the formal statement, traces every symbol to its definition, and ends with a four-line checklist. Sign or refuse it with the **Semantic read** issue form; your answers become a `read` cycle under your name. Two independent signatures close gap EG2.
- **Anything else**: open a plain issue.

Rules and templates: https://github.com/Nervous-Machine/DEBRIEF/blob/main/CONTRIBUTING.md. Every contribution is one dated cycle under your own name and goes into `CITATION.cff` and the next release.

## Layout

```
ledger/erdos306.json   the ledger (protocol 0.1.0)
claim.yaml            the pinned claim this record was opened from
SCORECARD.md / ASKS.md  generated from the ledger
prereg_rerun.yaml     the pre-registration of cycle 1 (hashed; copy it for your own rerun)
trace/                the reading guide for the semantic question (cycle 2)
cycles/               contributed cycles, one file each
```

## Words

This record never calls the claim proved, verified or a theorem. It records what was claimed, what was checked by whom under what rule, and what is still open. Nothing here has standing until a cycle gives it one.
