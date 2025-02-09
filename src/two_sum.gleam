import gleam/dict.{type Dict}
import gleam/list

fn two_sum_recursive(
  nums: List(Int),
  index: Int,
  target: Int,
  lookup: Dict(Int, Int),
) -> Result(#(Int, Int), Nil) {
  case nums {
    [] -> Error(Nil)
    [num, ..rest] -> {
      let complement = target - num
      case dict.get(lookup, complement) {
        Ok(complement_index) if complement_index != index ->
          Ok(#(index, complement_index))
        _ -> two_sum_recursive(rest, index + 1, target, lookup)
      }
    }
  }
}

/// a function that takes a list of numbers and a target number
/// returns the indices of two items in the nums list that add to the target
/// example: two_sum([1,2,3], 3) = Ok(#(0,1))
/// 1 + 2 = 3
pub fn two_sum(nums: List(Int), target: Int) -> Result(#(Int, Int), Nil) {
  let lookup =
    list.index_map(nums, fn(x, i) { #(x, i) })
    |> dict.from_list

  two_sum_recursive(nums, 0, target, lookup)
}
