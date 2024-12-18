/**
 * 2109. Adding Spaces to a String: https://leetcode.com/problems/adding-spaces-to-a-string/description/
 *
 * Problem Description:
 * You are given a 0-indexed string `s` and a 0-indexed integer array `spaces` that describes
 * the indices in the original string where spaces will be added. Each space should be inserted
 * before the character at the given index.
 *
 * Examples:
 * - Input: s = "EnjoyYourCoffee", spaces = [5, 9]
 *   Output: "Enjoy Your Coffee"
 *   (Spaces added before 'Y' and 'C')
 *
 * - Input: s = "LeetcodeHelpsMeLearn", spaces = [8,13,15]
 *   Output: "Leetcode Helps Me Learn"
 *
 * - Input: s = "icodeinpython", spaces = [1,5,7,9]
 *   Output: "i code in py thon"
 *
 * - Input: s = "spacing", spaces = [0,1,2,3,4,5,6]
 *   Output: " s p a c i n g"
 *
 * Constraints:
 * - 1 <= s.length <= 3 * 10^5
 * - s consists only of lowercase and uppercase English letters
 * - 1 <= spaces.length <= 3 * 10^5
 * - 0 <= spaces[i] <= s.length - 1
 * - All values of spaces are strictly increasing
 *
 * @param s The original string to modify
 * @param spaces Array of indices where spaces should be inserted
 * @return The modified string with spaces added
 */

import UIKit

func addSpaces(_ s: String, _ spaces: [Int]) -> String {
    
    var res = [String]()
    var (i, j) = (0, 0)
    
    for ch in s{
        if (j < spaces.count) {
            if (i == spaces[j]){
                res.append(" ")
                j += 1
            }
        }
        res.append(String(ch))
        i += 1
    }
    let resStr = res.joined()
    
    return resStr
}

//let s = "LeetcodeHelpsMeLearn", spaces = [8,13,15]
let s = "spacing", spaces = [0,1,2,3,4,5,6]
print(addSpaces(s, spaces))

