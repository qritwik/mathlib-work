import MathlibWork
open MathlibWork

example (data : Nat → ℝ) : squaredError ∅ data 42 = 0 := by
  simp [squaredError]

example (x center : ℝ) : squaredError {0} (fun _ : Nat => x) center = (x - center)^2 := by
  simp [squaredError]

example (candidate : ℝ) :
    squaredError ({0, 1} : Finset Nat) (fun i => if i = 0 then 1 else 3) 2 ≤
      squaredError ({0, 1} : Finset Nat) (fun i => if i = 0 then 1 else 3) candidate := by
  apply balanced_center_minimizes
  norm_num

example (s : Finset Nat) (data : Nat → ℝ) (center : ℝ) :
    0 ≤ squaredError s data center := squaredError_nonneg s data center
