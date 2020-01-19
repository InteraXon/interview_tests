package com.interaxon.interview.debug_test;

import java.util.Arrays;

@SuppressWarnings("ALL")
public class JavaDebugTest {

    int solution(int[] A, int[] B) {
        int n = A.length;
        int m = B.length;
        Arrays.sort(A);
        Arrays.sort(B);
        int i = 0;
        for (int k = 0; k < n; k++) {
            if (i < m - 1 && B[i] < A[k])
                i += 1;
            if (A[k] == B[i])
                return A[k];
        }
        return -1;
    }


    public static void main(String[] args) {


    }
}
