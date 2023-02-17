import XCTest

func commonMin(_ A: inout [Int], _ B: inout [Int]) -> Int {
  let n: Int = A.count
  let m: Int = B.count
  A.sort()
  B.sort()
  var k: Int = 0
  var i: Int = 0
  while k < n {
    if i < m - 1 && B[i] < A[k] {
        i += 1
    }
    if A[k] == B[i] {
      return A[k]
    }
    k += 1

  }
  return -1
}

class CommonMinTests: XCTestCase {

    func testCommonMin() {
        var A = [3, 5, 6]
        var B = [2, 3, 7]
        XCTAssertEqual(commonMin(&A, &B), 3)
    }

}
