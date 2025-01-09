/**
 * ================================================================
 * 58. Length of Last Word
 * ================================================================
 * Problem Description:
 * Given a string `s` consisting of words and spaces, return the length of the
 * last word in the string.
 *
 * Note: A word is a maximal substring consisting of non-space characters only.
 *
 * Examples:
 * Example 1:
 * Input: s = "Hello World"
 * Output: 5
 * Explanation: The last word is "World" with length 5.
 *
 * Example 2:
 * Input: s = "   fly me   to   the moon  "
 * Output: 4
 * Explanation: The last word is "moon" with length 4.
 *
 * Example 3:
 * Input: s = "luffy is still joyboy"
 * Output: 6
 * Explanation: The last word is "joyboy" with length 6.
 *
 * Constraints:
 * - 1 <= s.length <= 10^4
 * - s consists of only English letters and spaces ' '
 * - There will be at least one word in s
 * ================================================================
 */

/* Solution of first attempt
 
 func lengthOfLastWord1(_ s: String) -> Int {
    
    var currentWord = ""
    var words = [String]()
    
    for ch in s{
        if ch == " "{
            if currentWord != ""{
                words.append(currentWord)
            }
            currentWord = ""
        }
        else{
            currentWord.append(ch)
        }
    }
    if currentWord != ""{
        words.append(currentWord)
    }
    let lastWord = words.last
    return lastWord!.count
}*/

// Optimal solution

func lengthOfLastWord(_ s: String) -> Int {
    var (i, chrs) = (s.count - 1, Array(s))
    
    // Loop to eliminate spaces after last word (e.g.: "Hello World__")
    while i >= 0 && chrs[i] == " " {
        i -= 1
    }
    //set last pointer to last char of last word
    let last = i
    
    //traverse till encountered space
    while i >= 0 && chrs[i] != " " {
        i -= 1
    }
    print(i)
    return last - i
}
//lengthOfLastWord( "   fly me   to   the moon  " )
lengthOfLastWord( "Hello World" )
