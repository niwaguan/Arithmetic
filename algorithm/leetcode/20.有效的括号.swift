/*
 * @lc app=leetcode.cn id=20 lang=swift
 *
 * [20] 有效的括号
 */
class Solution {
    func isValid(_ s: String) -> Bool {
        let map = Dictionary<Character, Character>(dictionaryLiteral: ("}", "{" ), ("]", "["), (")", "("))
        
        var stack: [Character] = []
        
        for char in s {
            switch char {
            case "{", "(", "[" :
                stack.append(char)
            case "}", ")", "]":
                let shouldBe = map[char]
                let truth = stack.popLast()
                if (shouldBe != truth) {
                    return false
                }
            default:
                return false
            }
        }
        
        return stack.isEmpty
    }
}

