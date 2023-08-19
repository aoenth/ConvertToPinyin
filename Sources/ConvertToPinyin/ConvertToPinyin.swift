import Foundation

public extension Character {
    var isChineseCharacter: Bool {
        for character in unicodeScalars {
            if 0x4e00 + 1 ..< 0x9fff ~= character.value {
                return true
            }
        }
        return false
    }
}

public extension String {
    var containsChineseCharacters: Bool {
        for character in self {
            if character.isChineseCharacter {
                return true
            }
        }
        return false
    }

    #if !os(Linux)
    var pinyin: String {
        let string = NSMutableString(string: self)
        string
            .applyTransform(
                .toLatin,
                reverse: false,
                range: .init(location: 0, length: string.length),
                updatedRange: nil
            )

        return string as String
    }

    var romanized: String {
        let string = NSMutableString(string: self)
        
        string
            .applyTransform(
                .toLatin,
                reverse: false,
                range: .init(location: 0, length: string.length),
                updatedRange: nil
            )
        
        string.applyTransform(
            .stripCombiningMarks,
            reverse: false,
            range: .init(location: 0, length: string.length),
            updatedRange: nil
        )

        return string as String
    }
    #endif
}
