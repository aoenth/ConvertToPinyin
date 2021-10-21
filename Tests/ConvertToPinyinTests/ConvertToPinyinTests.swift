import XCTest
import ConvertToPinyin

final class ConvertToPinyinTests: XCTestCase {
    func test_romanized_englishShouldStayTheSame() {
        let testString = "abc Hello World"
        let result = testString.romanized

        XCTAssertEqual(result, testString)
    }

    func test_romanized_chineseShouldBeRomanized() {
        let testString = "你好"
        let result = testString.romanized

        XCTAssertEqual(result, "ni hao")
    }
}
