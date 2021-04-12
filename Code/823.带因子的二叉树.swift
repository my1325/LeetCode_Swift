/*
 * @lc app=leetcode.cn id=823 lang=swift
 *
 * [823] 带因子的二叉树
 *
 * https://leetcode-cn.com/problems/binary-trees-with-factors/description/
 *
 * algorithms
 * Medium (42.26%)
 * Likes:    53
 * Dislikes: 0
 * Total Accepted:    2.3K
 * Total Submissions: 5.4K
 * Testcase Example:  '[2,4]'
 *
 * 给出一个含有不重复整数元素的数组，每个整数均大于 1。
 *
 * 我们用这些整数来构建二叉树，每个整数可以使用任意次数。
 *
 * 其中：每个非叶结点的值应等于它的两个子结点的值的乘积。
 *
 * 满足条件的二叉树一共有多少个？返回的结果应模除 10 ** 9 + 7。
 *
 *
 *
 * 示例 1:
 *
 *
 * 输入: A = [2, 4]
 * 输出: 3
 * 解释: 我们可以得到这些二叉树: [2], [4], [4, 2, 2]
 *
 * 示例 2:
 *
 *
 * 输入: A = [2, 4, 5, 10]
 * 输出: 7
 * 解释: 我们可以得到这些二叉树: [2], [4], [5], [10], [4, 2, 2], [10, 2, 5], [10, 5, 2].
 *
 *
 *
 * 提示:
 *
 *
 * 1 <= A.length <= 1000.
 * 2 <= A[i] <= 10 ^ 9.
 *
 *
 */

// @lc code=start
class Solution {
    var pow109: Int = (0 ..< 9).reduce(1) { initialValue, _ in initialValue * 10 }

    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        guard arr.count > 0 else { return 0 }
        for value in arr {
            _cacheSituation[value] = []
        }
        return _buildTree(arr) % (pow109 + 7)
    }

    var _cacheSituation: [Int: [(Int, Int)]] = [:]
    func _buildTree(_ array: [Int]) -> Int {
        for _index in 0 ..< array.count {
            let _value = array[_index]
            for __index in 0 ..< array.count {
                let __value = array[__index]
                let product = _value * __value
                if let cacheSituation = _cacheSituation[product] {
                    var __cacheSituation = cacheSituation
                    __cacheSituation.append((_value, __value))
                    _cacheSituation[product] = __cacheSituation
                }
            }
        }
        return getCounts() + array.count
    }

    func getCounts() -> Int {
        var count = 0
        for (value, situations) in _cacheSituation {
            count += getCounts(for: value, in: situations)
        }
        return count
    }

    var _cacheCount: [Int: Int] = [:]
    func getCounts(for value: Int, in situations: [(Int, Int)]) -> Int {
        if let _count = _cacheCount[value] {
            return _count
        }

        var count = 0
        count += situations.count
        for (left, right) in situations {
            /// left count
            let leftCount = getCounts(for: left, in: _cacheSituation[left]!)
            /// right count
            let rightCount = getCounts(for: right, in: _cacheSituation[right]!)
            count += (rightCount + leftCount)
            if leftCount != 0, rightCount != 0 {
                count += rightCount * leftCount
            }
        }
        _cacheCount[value] = count
        return count
    }
}

// @lc code=end
