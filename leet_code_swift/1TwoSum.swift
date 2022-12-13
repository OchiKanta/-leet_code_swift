// https://leetcode.com/problems/two-sum/description/


class TwoSum1 {
    // 全検索: 計算量maxO(n^2)
    func solveA(_ nums: [Int], _ target: Int) -> [Int] {
        for (indexX, valueX) in nums.enumerated() {
            for (indexY, valueY) in nums.enumerated() {
                if (indexX == indexY) {continue}
                if (valueX + valueY == target) {
                    return [indexX, indexY]
                }
            }
        }
        return []
    }
    
    // 全検索: 計算量maxO(nums.length)
    func solveB(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionary: Dictionary<Int, Int> = [:]
        for (index, value) in nums.enumerated() {
            let complement = target - value
            if let _index = dictionary[complement] {
                return [_index, index]
            } else {
                dictionary[value] = index
            }
        }
        return []
    }
}
