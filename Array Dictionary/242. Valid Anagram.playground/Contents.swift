/**
 * 242. Valid Anagram:  https://leetcode.com/problems/valid-anagram/description/
 *
 * Problem Description:
 * Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise.
 *
 * Examples:
 * - Input: s = "anagram", t = "nagaram"
 *   Output: true
 */

func isAnagram(_ s: String, _ t: String) -> Bool {

    var dict = [String : Int]()
    
    for ch in s{
        if let count = dict[String(ch)]{
            dict[String(ch)] = count + 1
        }
        else{
            dict[String(ch)] = 1
        }
    }
    
    for ch in t{
        if let count = dict[String(ch)]{
            if count <= 1{
                dict.removeValue(forKey: String(ch))
            }
            else{
                dict[String(ch)] = count - 1
            }
        }
        else{
            return false
        }
    }
    
    // if empty dict it's anagram
    return dict.isEmpty ? true : false
    
    /* ** Sort and compare solution **
        return s.sorted(by: <) == t.sorted(by: <)
    */
}

isAnagram("anagram", "nagaram")

/*
 * Primary Approach (Dictionary):
 * - Time Complexity: O(n) where n is the length of input strings
 * - Space Complexity: O(k) where k is the number of unique characters
 *
 * How it works:
 * 1. Build frequency map for first string:
 *    - Iterate through string 's'
 *    - Count occurrence of each character in dictionary
 *
 * 2. Validate second string against frequency map:
 *    - Iterate through string 't'
 *    - For each character, decrease its count in dictionary
 *    - Remove character from dict when count reaches 0
 *    - Return false if character not found in dictionary
 *
 * 3. Final check:
 *    - If dictionary is empty, strings are anagrams
 *    - If dictionary has remaining entries, not anagrams
 *
 */

