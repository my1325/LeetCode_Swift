/*
 * @lc app=leetcode.cn id=57 lang=swift
 *
 * [57] 插入区间
 *
 * https://leetcode-cn.com/problems/insert-interval/description/
 *
 * algorithms
 * Medium (40.46%)
 * Likes:    413
 * Dislikes: 0
 * Total Accepted:    71.4K
 * Total Submissions: 175.9K
 * Testcase Example:  '[[1,3],[6,9]]\n[2,5]'
 *
 * 给你一个 无重叠的 ，按照区间起始端点排序的区间列表。
 *
 * 在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。
 *
 *
 *
 * 示例 1：
 *
 *
 * 输入：intervals = [[1,3],[6,9]], newInterval = [2,5]
 * 输出：[[1,5],[6,9]]
 *
 *
 * 示例 2：
 *
 *
 * 输入：intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 * 输出：[[1,2],[3,10],[12,16]]
 * 解释：这是因为新的区间 [4,8] 与 [3,5],[6,7],[8,10] 重叠。
 *
 * 示例 3：
 *
 *
 * 输入：intervals = [], newInterval = [5,7]
 * 输出：[[5,7]]
 *
 *
 * 示例 4：
 *
 *
 * 输入：intervals = [[1,5]], newInterval = [2,3]
 * 输出：[[1,5]]
 *
 *
 * 示例 5：
 *
 *
 * 输入：intervals = [[1,5]], newInterval = [2,7]
 * 输出：[[1,7]]
 *
 *
 *
 *
 * 提示：
 *
 *
 * 0
 * intervals[i].length == 2
 * 0
 * intervals 根据 intervals[i][0] 按 升序 排列
 * newInterval.length == 2
 * 0
 *
 *
 */

// @lc code=start
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else { return [newInterval] }

        var _intervals = intervals

        var begin = intervals[0][0], end = intervals[0][1]
        var _begin = newInterval[0], _end = newInterval[1]

        var res: [[Int]] = []
        while !_intervals.isEmpty {
            let next = _intervals.removeFirst()
            begin = next[0]
            end = next[1]
            if begin > _end {
                res.append([_begin, _end])
                res.append(next)
                break
            } else if end < _begin {
                res.append(next)
            } else if _begin <= begin, _end >= end {
                continue
            } else {
                _begin = min(begin, _begin)
                _end = max(end, _end)
            }
        }

        if _end >= intervals.last!.last! {
            res.append([_begin, _end])
        } else {
            res.append(contentsOf: _intervals)
        }
        return res
    }
}

// @lc code=end
