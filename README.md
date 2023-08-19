# ConvertToPinyin

## Usage
The package contains an extension on String with computed properties `romanized` and `pinyin`. The difference is that the latter contains the tone marks.
```swift
import ConvertToPinyin

let string = "你好"

print(string.romanized)
// ni hao

print(string.pinyin)
// nǐ hǎo

print(string.containsChineseCharacters)
// true

let character: Character = "福"
print(string.isChineseCharacter)
```
