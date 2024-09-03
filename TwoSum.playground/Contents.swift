import UIKit

/*
 
 Leetcode - https://leetcode.com/problems/two-sum/description/
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

  
 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
 
 */

func twoSumBruteForce(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        for j in (i + 1)..<nums.count{
            if(nums[i] + nums[j] == target){
                return [i, j]
            }
        }
    }
    return [-1]
}

//print(twoSumBruteForce([2,7,11,15], 9))  // TC - O(N^2)

func twoSumOptimised(_ nums: [Int], _ target: Int) -> [Int] {

    var hashmap = [Int:Int]()
    for i in 0..<nums.count{
        let lookup = target - nums[i]
        if let index = hashmap[lookup]{
            return [i, index]
        }
        hashmap[nums[i]] = i
    }
    
    return [-1]
}

print(twoSumOptimised([3,3], 6))  // TC - O(N)

/*
 Test cases
 Inputs, Target, Output
 [2,7,11,15], 9 , [0,1]
 [3,2,4], 6 , [1,2]
 [3,3],  6 , [0,1]
 */
