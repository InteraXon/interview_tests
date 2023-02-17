import XCTest

func anagrams(_ targetWord: String, _ dictionary: [String]) -> [String] {
	// complete your solution here.
	return [];
}

class AnagramTests: XCTestCase {

    let dictionary = ["tar", "rat", "married"]

    func test1() {
        XCTAssertEqual(anagrams("art", dictionary), ["tar", "rat"])
    }
    
    func test2() {
        XCTAssertEqual(anagrams("admirer", dictionary), ["married"])
    }
    
    func test3() {
        XCTAssertEqual(anagrams("orange", dictionary), [])
    }

}
