import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-! Finite squared-error objectives and their exact algebraic decomposition. -/
namespace MathlibWork

/-- Squared error over an explicit finite set. Repeated samples use distinct indices. -/
noncomputable def squaredError (s : Finset ι) (data : ι → ℝ) (center : ℝ) : ℝ :=
  ∑ i ∈ s, (data i - center) ^ 2

/-- Squared error cannot be negative, including for an empty dataset. -/
theorem squaredError_nonneg (s : Finset ι) (data : ι → ℝ) (center : ℝ) :
    0 ≤ squaredError s data center := by
  unfold squaredError
  exact Finset.sum_nonneg fun i _ => sq_nonneg (data i - center)

/-- Completing the square for one observation. -/
theorem square_shift (x center offset : ℝ) :
    (x - (center + offset)) ^ 2 =
      (x - center) ^ 2 - 2 * offset * (x - center) + offset ^ 2 := by
  ring

/-- Exact loss decomposition around a center with zero total residual. -/
theorem squaredError_shift (s : Finset ι) (data : ι → ℝ) (center offset : ℝ)
    (balanced : ∑ i ∈ s, (data i - center) = 0) :
    squaredError s data (center + offset) =
      squaredError s data center + (s.card : ℝ) * offset ^ 2 := by
  unfold squaredError
  simp_rw [square_shift]
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum,
    balanced, mul_zero, sub_zero, Finset.sum_const, nsmul_eq_mul]

/-- A balanced center globally minimizes squared error over every real center. -/
theorem balanced_center_minimizes (s : Finset ι) (data : ι → ℝ) (center : ℝ)
    (balanced : ∑ i ∈ s, (data i - center) = 0) (candidate : ℝ) :
    squaredError s data center ≤ squaredError s data candidate := by
  have decomposition := squaredError_shift s data center (candidate - center) balanced
  have nonneg : 0 ≤ (s.card : ℝ) * (candidate - center) ^ 2 :=
    mul_nonneg (Nat.cast_nonneg _) (sq_nonneg _)
  have cancel : center + (candidate - center) = candidate := by ring
  rw [cancel] at decomposition
  linarith

end MathlibWork
