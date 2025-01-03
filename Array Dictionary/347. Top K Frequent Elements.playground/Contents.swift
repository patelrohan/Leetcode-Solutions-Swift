/**
 * ================================================================
 * 347. Top K Frequent Elements: https://leetcode.com/problems/top-k-frequent-elements
 * ================================================================
 * Problem Description:
 * Given an integer array `nums` and an integer `k`, return the k most frequent elements.
 * The answer can be returned in any order.
 *
 * Examples:
 * Example 1:
 * Input: nums = [1,1,1,2,2,3], k = 2
 * Output: [1,2]
 * Explanation: 1 occurs 3 times, 2 occurs 2 times, 3 occurs once
 *
 * Example 2:
 * Input: nums = [1], k = 1
 * Output: [1]
 *
 * ================================================================
 * Solution Approach
 * ================================================================
 * Algorithm: Bucket Sort
 * Time Complexity: O(n) where n is the length of input array
 * Space Complexity: O(n) for storing frequency map and bucket array
 *
 * Solution Steps:
 * 1. Build Frequency Map
 *    - Create dictionary `frequencyDict` to store `[num : freq]` pairs that stores
 *      how many times each number appears in input array `nums`
 *
 * 2. Create Frequency Buckets
 *    - Create array `freqArray` of size n+1 where each index represents frequency
 *    - Each bucket (index) contains array of numbers with that frequency
 *    - Map numbers to their frequency buckets: `freqArray[freq].append(num)`
 *    - Example: If 2 and 3 appears 3 times, put `[2,3]` in `freqArray[3]`
 *
 * 3. Collect Top K Elements
 *    - Start from highest possible frequency (nums.count)
 *    - Work backwards until we have k elements
 *    - Numbers in higher frequency buckets are added first
 *
 * @param nums Input array of integers
 * @param k Number of top frequent elements to return
 * @return Array of k most frequent elements
 * ================================================================
 */

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    // Step 1: Build frequency map
    var frequencyDict = [Int : Int]()
    
    for num in nums {
        if let freq = frequencyDict[num] {
            frequencyDict[num] = freq + 1
        } else {
            frequencyDict[num] = 1
        }
    }
    
    // Step 2: Create frequency buckets
    var freqArray = Array(repeating: [Int](), count: nums.count + 1)
    
    for (num, freq) in frequencyDict {
        freqArray[freq].append(num)
    }
    
    // Step 3: Collect top K elements from highest frequency buckets
    var count = nums.count
    var res = [Int]()
    
    while(res.count < k) {
        res += freqArray[count]
        count -= 1
    }
    return res
}

topKFrequent([0,1,0,1,1,2,2,3,0,0,3], 3)
