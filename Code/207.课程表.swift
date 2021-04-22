/*
 * @lc app=leetcode.cn id=207 lang=swift
 *
 * [207] 课程表
 *
 * https://leetcode-cn.com/problems/course-schedule/description/
 *
 * algorithms
 * Medium (54.80%)
 * Likes:    785
 * Dislikes: 0
 * Total Accepted:    106.7K
 * Total Submissions: 195.1K
 * Testcase Example:  '2\n[[1,0]]'
 *
 * 你这个学期必须选修 numCourses 门课程，记为 0 到 numCourses - 1 。
 *
 * 在选修某些课程之前需要一些先修课程。 先修课程按数组 prerequisites 给出，其中 prerequisites[i] = [ai, bi]
 * ，表示如果要学习课程 ai 则 必须 先学习课程  bi 。
 *
 *
 * 例如，先修课程对 [0, 1] 表示：想要学习课程 0 ，你需要先完成课程 1 。
 *
 *
 * 请你判断是否可能完成所有课程的学习？如果可以，返回 true ；否则，返回 false 。
 *
 *
 *
 * 示例 1：
 *
 *
 * 输入：numCourses = 2, prerequisites = [[1,0]]
 * 输出：true
 * 解释：总共有 2 门课程。学习课程 1 之前，你需要完成课程 0 。这是可能的。
 *
 * 示例 2：
 *
 *
 * 输入：numCourses = 2, prerequisites = [[1,0],[0,1]]
 * 输出：false
 * 解释：总共有 2 门课程。学习课程 1 之前，你需要先完成​课程 0 ；并且学习课程 0 之前，你还应先完成课程 1 。这是不可能的。
 *
 *
 *
 * 提示：
 *
 *
 * 1
 * 0
 * prerequisites[i].length == 2
 * 0 i, bi < numCourses
 * prerequisites[i] 中的所有课程对 互不相同
 *
 *
 */

// @lc code=start
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        guard prerequisites.count > 0 else { return true }
        guard prerequisites.count > 1 else { return prerequisites[0].count <= numCourses }
        var inCount: [Int: Int] = [:]
        var queue: [Int] = []
        var courseMap: [Int: [Int]] = [:]
        /// 找到结点的入度
        for subprerequisites in prerequisites {
            let to = subprerequisites[0]
            let from = subprerequisites[1]
        
            var count = inCount[to] ?? 0
            count += 1
            inCount[to] = count
        
            if inCount[from] == nil {
                inCount[from] = 0
            }
        
            var courselist = courseMap[from] ?? []
            courselist.append(to)
            courseMap[from] = courselist
        }
    
        /// 找到入度为0的结点
        for (course, dependencies) in inCount {
            if dependencies == 0 {
                queue.append(course)
            }
        }
    
        /// 已经修过的课
        var list: Int = 0
        while !queue.isEmpty {
            list += 1
            let course = queue.removeFirst()
            let courseList = courseMap[course] ?? []
            for _course in courseList {
                var count = inCount[_course] ?? 0
                count -= 1
                if count == 0 {
                    queue.append(_course)
                } else {
                    inCount[_course] = count
                }
            }
        }
        return list == inCount.count
    }
}

// @lc code=end
