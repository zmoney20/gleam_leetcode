import gleeunit
import gleeunit/should
import two_sum.{two_sum}

pub fn main() {
  gleeunit.main()
}

pub fn first_test() {
  two_sum([1, 2, 3], 3)
  |> should.equal(Ok(#(0, 1)))
}

pub fn second_test() {
  two_sum([5, 10, 15, 20], 35)
  |> should.equal(Ok(#(2, 3)))
}

pub fn third_test() {
  two_sum([7, 4, 12, 1, 2, 3], 10)
  |> should.equal(Ok(#(0,5)))
}

pub fn fourth_test() {
  two_sum([1,2,3], 9)
  |> should.equal(Error("No matches found"))
}
