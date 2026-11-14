# Definitional trace of the formal statement of Erdős Problem #306

**For:** a mathematician willing to spend thirty to forty-five minutes, not a day, deciding whether the formal statement
of Erdős Problem #306 in Google DeepMind's formal-conjectures repository says what Erdős and Graham asked. That is the
one open question that no machine settles. Everything downstream of it is already checked by machine: the claimant's
Lean development builds (finding E1) and proves that formal statement word for word (finding E2).

**What this is.** The problem as posed, the formal statement verbatim, every definition it depends on down to Mathlib
and Lean core with file and line, a plain-language rendering of each piece, worked examples that Lean itself checked,
the places where Lean's conventions differ from the blackboard, and a sign-off checklist. The renderings are the reading
of the operating agent (Claude Code, for Nervous Machine) on 14 November 2026. They are an aid, not a check.

**What this is not.** Not an independent human semantic review, and it changes no standing. Gap EG2 stays open until a
person who is not an author signs the checklist at the end. It says nothing about the paper's argument (gap EG3).

**Sources, pinned.** Formal statement: `FormalConjectures/ErdosProblems/306.lean` in google-deepmind/formal-conjectures
at commit `e028240a61822d970c933f4656f51da025cf200b` (blob `f7940968`, file sha256 `7a5d90ac5eef16085ff86291dd44002583ec7ddfabf1631cc0e76d4bf3479a89`).
Problem page: https://www.erdosproblems.com/306 as read on 2026-11-14 (page last edited 21 June 2026). Mathlib at
revision `921b8d39f71a5c813b526f38e4033417d40b4c3d` and Lean core `v4.29.0-rc6`, the versions the claimant's development
pins and the ones inside which every line below was printed. Machine transcript: `cycles/trace-2/trace.txt`, produced by
`lake env lean` on `cycles/trace-2/Trace.lean` inside the built development; every example in Part D comes from it.
Pre-registration for this trace: `prereg_trace.yaml`.

---

## 0. Conventions a reviewer has to know

| convention | where | what it means here |
|---|---|---|
| `Nat.Prime p` is `Irreducible p` | `Mathlib/Data/Nat/Prime/Defs.lean` l.42 | a natural number at least 2 whose only divisors are 1 and itself (`Nat.prime_def`) |
| `Squarefree r` is "every square dividing r is a unit" | `Mathlib/Algebra/Squarefree/Basic.lean` l.41: `∀ x : R, x * x ∣ r → IsUnit x` | in ℕ the only unit is 1, so: no `x ≥ 2` has `x² ∣ r`. Note `Squarefree 1` holds and `Squarefree 0` fails. |
| A rational is stored reduced | Lean core `Init/Data/Rat/Basic.lean` l.32–43: fields `num : Int`, `den : Nat`, `den_nz : den ≠ 0`, `reduced : num.natAbs.Coprime den` | `q.den` is the denominator of `q` in lowest terms, always positive |
| Division by zero is zero | all Lean fields, including ℚ | `(1 : ℚ) / 0 = 0`. It never arises here: `ω (n i) = 2` forces `n i ≠ 0` (Part D, example 6). |
| Numerals in `Fin m` wrap | Lean core `Init/Data/Fin/Basic.lean` l.234, `instOfNat` | `(1 : Fin 1) = 0`. This matters only for `k = 0` (Part E, D1). |
| `Fin.last k = ⟨k, _⟩` | Lean core `Init/Data/Fin/Basic.lean` l.279 | the largest element of `Fin (k + 1)`, i.e. the index `k` |
| `Finset.Icc a b` is the closed interval | `Mathlib/Order/Interval/Finset/Defs.lean` l.303, `mem_Icc : x ∈ Icc a b ↔ a ≤ x ∧ x ≤ b` | over `Fin (k + 1)`, `Icc 1 (Fin.last k)` is the index set `{1, …, k}` when `k ≥ 1` |
| `ω` and `Ω` are scoped notation | `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean` l.322 and l.257 | `ω = cardDistinctFactors`, `Ω = cardFactors`; both are opened in the file |
| `(1 : ℚ) / (n i)` casts `n i : ℕ` into ℚ | coercion `↑` | the unit fraction with denominator `n i` |

---

## Part A. The problem as posed

**A1. The problem page**, verbatim (erdosproblems.com/306, citing [ErGr80], Erdős and Graham's 1980 monograph):

> Let $a/b \in \mathbb{Q}_{>0}$ with $b$ squarefree. Are there integers $1 < n_1 < \cdots < n_k$, each the product of two
> distinct primes, such that $\frac{a}{b} = \frac{1}{n_1} + \cdots + \frac{1}{n_k}$?

The page adds: for $n_i$ the product of three distinct primes this is true when $b = 1$ (Butler, Erdős and Graham, 2015).

**A2. The formal-conjectures docstring**, verbatim, repeats the same sentence and adds "The answer is yes [Li26]."

**What the trace does not check.** Whether the page's sentence is a faithful rendering of the 1980 monograph. The
operating agent did not consult the monograph. A reviewer with the book can sign or refuse checklist item A0; the rest
of the checklist takes the page's sentence as the problem.

---

## Part B. The formal statement, verbatim

**B1. formal-conjectures** (`FormalConjectures/ErdosProblems/306.lean` at the pinned commit, theorem `Erdos306.erdos_306`,
inside `open ArithmeticFunction` and `open scoped omega Omega`; the proof is `sorry` there because the file states the
problem, it does not solve it):

```lean
theorem erdos_306 : ∀ (q : ℚ), 0 < q → Squarefree q.den →
    ∃ k : ℕ, ∃ (n : Fin (k + 1) → ℕ), n 0 = 1 ∧ StrictMono n ∧
    (∀ i ∈ Finset.Icc 1 (Fin.last k), ω (n i) = 2 ∧ Ω (n i) = 2) ∧
    q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i)
```

The file tags this theorem `category research solved` and links a Lean proof by Linmiao Xu, which is a port of the
claimant's development (see the mission README). That tag is a repository label, not a reading of the statement
against the problem.

**B2. The claimant's own statement** (`lean/Erdos306/Main.lean` in daizisheng/erdos-306 at `1314c9a8`, as the built
development prints it):

```lean
Erdos306.erdos_306 : ∀ (q : ℚ), 0 < q → Squarefree q.den →
  ∃ F, (∀ n ∈ F, ∃ p r, Nat.Prime p ∧ Nat.Prime r ∧ p ≠ r ∧ n = p * r) ∧ ∑ n ∈ F, 1 / ↑n = q
```

Here `F : Finset ℕ`, a finite set of natural numbers, so distinctness is built in and no order is chosen.

**B3. The bridge.** The claimant's `Erdos306.erdos_306_formal_conjectures` restates B1 character for character and is
proved from B2. Cycle 1 copied B1 from the formal-conjectures file into Nervous Machine's own file and closed it with
that theorem by `exact`; the kernel accepted it with the three standard axioms (finding E2, `cycles/rerun-1/compare.txt`).
So a reviewer who is satisfied that B1 is the problem is satisfied for the claimant's statement too. The converse
direction (B1 implies B2) is not needed for the problem and is not claimed here.

---

## Part C. Every piece of B1, traced

| piece | Lean meaning, with source | agent's reading |
|---|---|---|
| `∀ (q : ℚ), 0 < q →` | ℚ is Lean's rational type (reduced `num/den`); `<` is the usual order | "for every positive rational $a/b$" |
| `Squarefree q.den →` | `q.den` is the denominator in lowest terms (core l.39, l.43); `Squarefree` as in §0 | "whose reduced denominator is squarefree". See D2 for why this is the same as the page's "with $b$ squarefree". |
| `∃ k : ℕ, ∃ (n : Fin (k + 1) → ℕ)` | a length `k` and a list `n 0, n 1, …, n k` of naturals indexed by `Fin (k + 1)` | "there are $k$ and natural numbers $n_0, n_1, \dots, n_k$" |
| `n 0 = 1 ∧ StrictMono n` | `StrictMono f := ∀ ⦃a b⦄, a < b → f a < f b` (`Mathlib/Order/Monotone/Defs.lean` l.86) | "$n_0 = 1$ and $n_0 < n_1 < \cdots < n_k$", hence "$1 < n_1 < \cdots < n_k$" (example 7). $n_0$ is a sentinel that encodes "$1 <$"; it is not a term of the sum. |
| `∀ i ∈ Finset.Icc 1 (Fin.last k), …` | the indices $1, \dots, k$ (§0; example 1 shows `Icc 1 (Fin.last 3) = {1, 2, 3}`) | "for each $i$ from 1 to $k$" |
| `ω (n i) = 2` | `cardDistinctFactors n = n.primeFactorsList.dedup.length` (`ArithmeticFunction/Misc.lean` l.318): the number of distinct primes dividing $n_i$ | "$n_i$ has exactly two distinct prime divisors" |
| `Ω (n i) = 2` | `cardFactors n = n.primeFactorsList.length` (l.253): the number of prime factors counted with multiplicity | "$n_i$ has exactly two prime factors counting multiplicity". Together with `ω = 2`: $n_i = pq$ with $p \ne q$ prime (example 3: 6 and 15 qualify, 4 and 12 do not). |
| `q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i)` | the sum over the same indices of the unit fractions, with `n i` cast to ℚ | "$a/b = 1/n_1 + \cdots + 1/n_k$" |

---

## Part D. Worked examples, checked by Lean

All from `cycles/trace-2/trace.txt`; the commands are in `cycles/trace-2/Trace.lean`.

1. `(1 : Fin 1) = 0` by `rfl`; `Finset.Icc (1 : Fin 1) (Fin.last 0)` evaluates to `{0}`; `Finset.Icc (1 : Fin 4) (Fin.last 3)` to `{1, 2, 3}`.
2. For `k = 0`, hypotheses `n 0 = 1` and the `ω`/`Ω` condition on `Icc 1 (Fin.last 0)` together give `False` (proved). So the statement cannot be satisfied with an empty sum; see D1.
3. `(ω 6, Ω 6) = (2, 2)`, `(ω 15, Ω 15) = (2, 2)`, `(ω 4, Ω 4) = (1, 2)`, `(ω 12, Ω 12) = (2, 3)`, `(ω 1, Ω 1) = (0, 0)`, `(ω 0, Ω 0) = (0, 0)`.
4. `Squarefree 6`, `Squarefree 1`, `¬ Squarefree 4`, `¬ Squarefree 12`, each proved from the definition and Mathlib lemmas.
5. `(6 / 4 : ℚ).den = 2`, `(3 / 4 : ℚ).den = 4`, `(2 : ℚ).den = 1`, `(10 / 6 : ℚ).den = 3`.
6. `(1 : ℚ) / 0 = 0`; and `ω m = 2 → m ≠ 0` (proved), so no denominator in the statement is zero.
7. From `n 0 = 1` and `StrictMono n`: every index `i > 0` has `1 < n i` (proved).
8. The two statements B1 and B2 as the development prints them, and the printed definitions of `Squarefree`, `StrictMono`, `cardDistinctFactors`, `cardFactors`, `Fin.last`, `Nat.Prime`.

---

## Part E. Discrepancies and observations

| id | observation | kind | effect, in the agent's reading |
|---|---|---|---|
| D1 | For `k = 0` the index set `Icc 1 (Fin.last 0)` is `{0}`, not empty, because `(1 : Fin 1) = 0`. | Lean numeral convention | none: the condition then demands `ω 1 = 2`, which fails (example 2), so `k ≥ 1` is forced and the sum always has at least one term. The page's "$1 < n_1 < \cdots < n_k$" likewise presupposes $k \ge 1$. |
| D2 | The page says "$a/b$ with $b$ squarefree" without saying lowest terms; the formal statement says the reduced denominator is squarefree. | wording | none: if some representation has squarefree $b$, the reduced denominator divides $b$ and is squarefree; conversely take $b$ to be the reduced denominator. The two conditions pick out the same rationals. A reviewer should confirm this reading. |
| D3 | The page says "integers $n_i$"; the formal statement uses natural numbers. | type | none, since $1 < n_i$ in both. |
| D4 | The formal statement carries a sentinel $n_0 = 1$ that is not a term of the sum. | encoding | none; it is how "$1 <$" is expressed. A careless reading could take $1/n_0 = 1$ to be a term; it is not, since the sum runs over `Icc 1 (Fin.last k)`. |
| D5 | "Product of two distinct primes" is encoded as `ω = 2 ∧ Ω = 2` rather than as `∃ p ≠ q prime, n = p * q`. | encoding | equivalent in the agent's reading: `Ω = 2` says the multiset of prime factors has two entries and `ω = 2` says they are distinct. The claimant's B2 uses the explicit form, and B3 shows B2 implies B1, which covers the direction the problem needs. |
| D6 | The claimant's README and Xu's port describe the formal-conjectures statement as `answer(sorry) ↔ P`; the file at the commit pinned here states `P` directly with proof `sorry`. | revision drift in the third-party file | none for this record, which pins the plain-`P` form; a reviewer using a different formal-conjectures revision should check which form they are reading. |
| D7 | The formal-conjectures file is already tagged `research solved`, citing the claimant's paper. | label | none on standing here; the tag records that a Lean proof exists, which E2 certifies independently, not that the statement was read against the problem. |

No discrepancy that changes the meaning was seen by the agent. No anomaly is opened.

---

## Part F. Sign-off checklist

For a reviewer who is prepared to put their name to a reading. Each line is a yes/no. Send it with the **Semantic read**
issue form on this repository (it becomes a `read` cycle under your name), or anywhere public; the ledger records it by
date. Two independent signatures with no refusal close gap EG2; one refusal reopens it.

- [ ] A0 (optional, needs the book): the page's sentence is Erdős and Graham's 1980 problem.
- [ ] A1: `0 < q` with `Squarefree q.den` is "$a/b \in \mathbb{Q}_{>0}$ with $b$ squarefree" (D2).
- [ ] A2: `n 0 = 1 ∧ StrictMono n` on `Fin (k + 1) → ℕ` is "integers $1 < n_1 < \cdots < n_k$" (D1, D3, D4).
- [ ] A3: `ω (n i) = 2 ∧ Ω (n i) = 2` is "$n_i$ is the product of two distinct primes" (D5).
- [ ] A4: `q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i)` is "$a/b = 1/n_1 + \cdots + 1/n_k$".
- [ ] B (optional): the claimant's statement B2 asks the same question in finite-set form; B3 is the bridge.

A reviewer who signs A1 to A4 has closed the semantic question for this problem. It would be the first such signature
in this register.
