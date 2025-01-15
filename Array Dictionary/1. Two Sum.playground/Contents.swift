func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var result = [Int]()
    var dict = [Int : Int]()
    
    for (index, value) in nums.enumerated(){
        let diff = target - value
        
        if (dict[diff] != nil){
            result.append(index)
            result.append(dict[diff]!)
            return result
        }
        else{
            dict[value] = index
        }
    }
    return result
}


let nums = [2,7,11,15], target = 9
twoSum(nums, target)

