import gleam/list

fn index_pair(pairs: List(#(Int, Int))) -> Result(#(Int, Int), String) {
  case pairs {
    [first_pair, second_pair] -> {
      let #(first_index, _) = first_pair
      let #(second_index, _) = second_pair
      Ok(#(first_index, second_index))
    }
    _ -> Error("No matches found")
  }
}

fn helper(
  pairs: List(#(Int, Int)),
  nums: List(Int),
  target: Int,
) -> Result(#(Int, Int), String) {
  pairs
  |> list.filter(fn(pair) {
    let #(_, x) = pair
    let complement = target - x
    list.contains(nums, complement)
  })
  |> index_pair()
}

/// a function that takes a list of numbers and a target number
/// returns the indices of two items in the nums list that add to the target
/// example: two_sum([1,2,3], 3) = Ok(#(0,1))
/// 1 + 2 = 3
pub fn two_sum(nums: List(Int), target: Int) -> Result(#(Int, Int), String) {
  nums
  |> list.index_map(fn(x, i) { #(i, x) })
  |> helper(nums, target)
}
