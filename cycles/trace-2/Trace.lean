import Erdos306
open ArithmeticFunction
open scoped ArithmeticFunction.omega ArithmeticFunction.Omega
-- Worked examples for the reading guide (cycle 2). Each line is checked by Lean; nothing here is asserted by hand.
-- 1. Numerals in Fin: in Fin 1 the numeral 1 is 0, so for k = 0 the index range Icc 1 (Fin.last 0) is {0}, not empty.
example : (1 : Fin 1) = 0 := rfl
#eval Finset.Icc (1 : Fin 1) (Fin.last 0)
#eval Finset.Icc (1 : Fin 4) (Fin.last 3)
-- 2. The k = 0 case cannot satisfy the statement: index 0 would have to carry n 0 = 1, and ω 1 = 0 ≠ 2.
example (n : Fin 1 → ℕ) (h0 : n 0 = 1)
    (h : ∀ i ∈ Finset.Icc (1 : Fin 1) (Fin.last 0), ω (n i) = 2 ∧ Ω (n i) = 2) : False := by
  have := h 0 (by decide)
  simp [h0] at this
-- 3. ω and Ω on small numbers: 6 = 2·3 qualifies; 4 = 2² and 12 = 2²·3 do not; 1 and 0 do not.
#eval (ω 6, Ω 6)
#eval (ω 4, Ω 4)
#eval (ω 12, Ω 12)
#eval (ω 15, Ω 15)
#eval (ω 1, Ω 1)
#eval (ω 0, Ω 0)
-- 4. Squarefree on small numbers, from the definition and Mathlib lemmas (decide cannot evaluate Mathlib's squarefree test).
example : Squarefree 6 := (Nat.squarefree_mul (by norm_num : Nat.Coprime 2 3)).2 ⟨Nat.prime_two.squarefree, Nat.prime_three.squarefree⟩
example : Squarefree 1 := squarefree_one
example : ¬ Squarefree 4 := fun h => by simpa [Nat.isUnit_iff] using h 2 (by norm_num)
example : ¬ Squarefree 12 := fun h => by simpa [Nat.isUnit_iff] using h 2 (by norm_num)
-- 5. q.den is the reduced denominator.
#eval (6 / 4 : ℚ).den
#eval (3 / 4 : ℚ).den
#eval (2 : ℚ).den
#eval (10 / 6 : ℚ).den
-- 6. Division by zero in ℚ is zero (a Lean convention a reader must know; it never arises here because ω (n i) = 2 forces n i ≠ 0).
example : (1 : ℚ) / 0 = 0 := by simp
example (m : ℕ) (h : ω m = 2) : m ≠ 0 := by rintro rfl; simp at h
-- 7. StrictMono on Fin (k+1) → ℕ with n 0 = 1 gives 1 < n 1 < ... < n k.
example (k : ℕ) (n : Fin (k + 1) → ℕ) (h0 : n 0 = 1) (hs : StrictMono n) (i : Fin (k + 1)) (hi : (0 : Fin (k+1)) < i) : 1 < n i := by
  have := hs hi; omega
-- 8. The statement as the built development prints it, and the claimant's own form; then the definitions behind them.
#check @Erdos306.erdos_306_formal_conjectures
#check @Erdos306.erdos_306
#print Squarefree
#print StrictMono
#print ArithmeticFunction.cardDistinctFactors
#print ArithmeticFunction.cardFactors
#print Fin.last
#print Nat.Prime
