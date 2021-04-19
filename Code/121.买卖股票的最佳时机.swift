/*
 * @lc app=leetcode.cn id=121 lang=swift
 *
 * [121] 买卖股票的最佳时机
 *
 * https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/description/
 *
 * algorithms
 * Easy (56.45%)
 * Likes:    1576
 * Dislikes: 0
 * Total Accepted:    424.6K
 * Total Submissions: 750K
 * Testcase Example:  '[7,1,5,3,6,4]'
 *
 * 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
 * 
 * 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
 * 
 * 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：[7,1,5,3,6,4]
 * 输出：5
 * 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
 * ⁠    注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：prices = [7,6,4,3,1]
 * 输出：0
 * 解释：在这种情况下, 没有交易完成, 所以最大利润为 0。
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * 0 
 * 
 * 
 */

// @lc code=start
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
    
        var _max = prices[1] - prices[0]
        var _res = _max
        for index in 2 ..< prices.count {
            _max = prices[index] - min(prices[index - 1] - _max, prices[index - 1])
            _res = max(_res, _max)
        }
        return max(_res, 0)
    }

    func _maxProfit(_ prices: [Int]) -> Int {
        var _max = 0
        var begin = 0
        var end = 0

        while begin < prices.count {
            end = begin
            while end < prices.count {
                let profit = prices[end] - prices[begin]
                _max = max(_max, profit)
                end += 1
            }
            begin += 1
        }
        return _max
    }
}
// @lc code=end

