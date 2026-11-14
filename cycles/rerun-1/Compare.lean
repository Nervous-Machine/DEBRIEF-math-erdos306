import Erdos306
open ArithmeticFunction
open scoped ArithmeticFunction.omega ArithmeticFunction.Omega
/- Statement copied verbatim from google-deepmind/formal-conjectures, FormalConjectures/ErdosProblems/306.lean,
   commit e028240a61822d970c933f4656f51da025cf200b (blob f7940968), theorem Erdos306.erdos_306; only the name differs. -/
theorem fc_erdos_306 : ∀ (q : ℚ), 0 < q → Squarefree q.den →
    ∃ k : ℕ, ∃ (n : Fin (k + 1) → ℕ), n 0 = 1 ∧ StrictMono n ∧
    (∀ i ∈ Finset.Icc 1 (Fin.last k), ω (n i) = 2 ∧ Ω (n i) = 2) ∧
    q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i) := by
  exact Erdos306.erdos_306_formal_conjectures
#print axioms fc_erdos_306
#print axioms Erdos306.erdos_306
#print axioms Erdos306.erdos_306_formal_conjectures
#check @Erdos306.erdos_306
#check @Erdos306.erdos_306_formal_conjectures
