import UIKit

/*
 
 Best Time to Buy and Sell Stock
 
 Leetcode - https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

  

 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 Example 2:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transactions are done and the max profit = 0.

 
 */

func maxProfitBruteForce(_ prices: [Int]) -> Int {
    var maxProfit = 0
    for i in 0..<prices.count{
        //loop to buy the stock on cheapest price day
        for j in (i+1)..<prices.count{
            //loop to sell stock on expensive day to make profit
            let value = prices[j] - prices[i]
            if value > 0 {
                maxProfit = max(maxProfit, value)
            }
        }
    }
    return maxProfit
}

//print(maxProfitBruteForce([7,1,5,3,6,4])) // O(N^2)


func maxProfitOptimised(_ prices: [Int]) -> Int {
    var maxProfit = 0
    var minPrice = prices[0]
    for i in 1..<prices.count{
        if prices[i] < minPrice{
            minPrice = prices[i]
        }
        let profit = prices[i] - minPrice
        if maxProfit < profit{
            maxProfit = profit
        }
    }
    return maxProfit
}

print(maxProfitOptimised([7,6,4,3,1])) // O(N)
