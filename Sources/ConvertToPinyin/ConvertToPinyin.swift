import Foundation

public extension String {
    var containsChineseCharacters: Bool {
        for character in unicodeScalars {
            if 0x4e00 + 1 ..< 0x9fff ~= character.value {
                return true
            }
        }
        return false
    }

    var pinyin: String {
        let stringReference = NSMutableString(string: self) as CFMutableString
        CFStringTransform(stringReference, nil, kCFStringTransformToLatin, false)

        return stringReference as String
    }

    var romanized: String {
        let stringReference = NSMutableString(string: self) as CFMutableString
        CFStringTransform(stringReference, nil, kCFStringTransformToLatin, false)
        CFStringTransform(stringReference, nil, kCFStringTransformStripCombiningMarks, false)

        return stringReference as String
    }
}
