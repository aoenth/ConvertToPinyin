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

    func test_pinyin_englishShouldStayTheSame() {
        let testString = "hello world"
        let result = testString.pinyin

        XCTAssertEqual(result, testString)
    }

    func test_pinyin_chineseShouldBecomePinyinWithToneMarks() {
        let testString = "你好"
        let result = testString.pinyin

        XCTAssertEqual(result, "nǐ hǎo")
    }
    
    func test_containsChineseCharacter_true() {
        let testString = "你好"
        XCTAssert(testString.containsChineseCharacters)
    }
    
    func test_containsChineseCharacter_false() {
        let testString = "hello"
        XCTAssertFalse(testString.containsChineseCharacters)
    }
    
    func test_isChineseCharacter_true() {
        let character: Character = "福"
        XCTAssert(character.isChineseCharacter)
    }
    
    func test_isChineseCharacter_falss() {
        let character: Character = "c"
        XCTAssertFalse(character.isChineseCharacter)
    }
}
