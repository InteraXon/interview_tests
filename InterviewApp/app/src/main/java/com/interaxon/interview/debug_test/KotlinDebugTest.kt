package com.interaxon.interview.debug_test

import java.util.*

fun solution(A: IntArray, B: IntArray): Int {
    val n = A.size
    val m = B.size
    Arrays.sort(A)
    Arrays.sort(B)
    var i = 0
    for (k in 0 until n) {
        if (i < m - 1 && B[i] < A[k])
            i += 1
        if (A[k] == B[i])
            return A[k]
    }
    return -1
}

fun main() {
    println("ok")
}
