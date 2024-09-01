import UIKit

/*
 
 Leetcode - https://leetcode.com/problems/product-of-array-except-self/
 
 Product of Array Except self
 
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.

  
 Example 1:

 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 Example 2:

 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]

 
 */

//Brute force - O(N^2)

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    var leftArr = [1]
    var rightArr = [Int](repeating: 0, count: nums.count)
    rightArr[nums.count - 1] = 1
    
    for i in 1..<nums.count{
        leftArr.append(leftArr[i-1] * nums[i-1])
    }
    
    for j in stride(from: nums.count - 2, through: 0, by: -1){
        rightArr[j] = rightArr[j+1] * nums[j+1]
    }
    
    for i in 0..<nums.count{
        result.append(leftArr[i] * rightArr[i])
    }
    
    print(leftArr)
    print(rightArr)
    return []
}

print(productExceptSelf([1,2,3,4]))  // O(N)
