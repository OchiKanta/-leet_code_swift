//https://leetcode.com/problems/climbing-stairs/


// フィボナッチ数列の問題
class ClimbingStairs70 {
    // 単純な再帰-計算量は指数的に増加
    func solveA(_ n: Int) -> Int {
        if (n == 1) { return 1 }
        if (n == 2) { return 2 }
        return solveA(n-2) + solveA(n-1)
    }
    
    // for文-計算量O(N-2)
    func solveB(_ n: Int) -> Int {
        var patterns: [Int] = [0, 1, 2]
        if (n <= 2) { return patterns[n] }
        for i in 3...n {
            patterns.append(patterns[i-1] + patterns[i-2])
        }
        return patterns[n]
    }
    
    
    // 動的計画法（再帰+メモ-計算量O(N-2)
    // -1: not calculate value
    var patternsWithC = [Int](repeating: -1, count: 46)
    func solveC(_ n: Int) -> Int {
        if (n == 1) { patternsWithC[1] = 1 }
        if (n == 2) { patternsWithC[2] = 2 }
        if (patternsWithC[n] != -1) { return patternsWithC[n] }
        let value = solveC(n-1) + solveC(n-2)
        patternsWithC[n] = value
        return value
    }
}
