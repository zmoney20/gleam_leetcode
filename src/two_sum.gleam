import gleam/dict
import gleam/list

/// a function that takes a list of numbers and a target number
/// returns the indices of two items in the nums list that add to the target
/// example: two_sum([1,2,3], 3) = Ok(#(0,1))
/// 1 + 2 = 3
pub fn two_sum(nums: List(Int), target: Int) -> Result(#(Int, Int), Nil) {
  let indexed = list.index_map(nums, fn(x, i) { #(x, i) })
  let complement_idx_lookup = dict.from_list(indexed)

  use #(num, idx) <- list.find_map(indexed)

  case dict.get(complement_idx_lookup, target - num) {
    Ok(complement_idx) if complement_idx != idx -> Ok(#(idx, complement_idx))
    _ -> Error(Nil)
  }
}
