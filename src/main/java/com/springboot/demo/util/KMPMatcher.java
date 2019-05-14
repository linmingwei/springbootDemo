package com.springboot.demo.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 5/13/2019 20:19
 * @Description:
 */
public class KMPMatcher {
    /**
     * 获取字符串的部分匹配表
     *
     * @param text
     * @return
     */
    public int[] getNext(String text) {
        int length = text.length();
        int[] next = new int[length];
        if (length == 0) {
            return null;
        }
        for (int i = 0; i < length; i++) {
            String sub = text.substring(0, i + 1);
            int maxLength = 0;
            for (int j = 0; j < sub.length()-1; j++) {
                String subChild = sub.substring(0, j + 1);
                if (sub.endsWith(subChild) && sub.length() > maxLength) {
                    maxLength = subChild.length();
                }

            }
            next[i] = maxLength;
        }
        return next;
    }

    /**
     * 获取匹配字符串的索引
     * @param text
     * @param matcher
     * @return
     */
    public List<Integer> getIndexOfStr(String text,String matcher) {
        char[] charsT = text.toCharArray();
        char[] charsM = matcher.toCharArray();
        List<Integer> index = new ArrayList<>();
        int[] next = getNext(text);
        int indexT = 0, indexM = 0;
        while (indexT < charsT.length) {
            if (charsT[indexT] == charsM[indexM]) {
                indexT++;
                indexM++;
            } else {
                if (indexM == 0) {
                    indexT++;
                }else {
                    indexT += indexM-next[indexT];
                }

            }
            if (indexM == charsM.length) {
                index.add(indexT - indexM);
                indexM = 0;
            }
        }
        return index;
    }
    public List<Integer> simpleMatcher(String text, String matcher) {
        char[] charsT = text.toCharArray();
        char[] charsM = matcher.toCharArray();
        List<Integer> index = new ArrayList<>();
        for (int i = 0; i <= text.length()-matcher.length(); i++) {
            for (int j = 0; j < matcher.length(); j++) {
                if (charsT[i + j] == charsM[j]) {
                    if (j == charsM.length - 1) {
                        index.add(i);
                    }
                    continue;
                }
                break;
            }
            
        }
        return index;
    }

    public static void main(String[] args) {
        KMPMatcher kmp = new KMPMatcher();
//        String text = "bawsssdfwes";
//        String matcher = "sdfiiiii";
        String text = "BBC ABCDAB ABCDABCDABDE";
        String matcher = "ABCDABD";
        int[] goods = kmp.getNext(text);
        List<Integer> indexOfStr = kmp.getIndexOfStr(text, matcher);
        System.out.println(kmp.simpleMatcher(text,matcher));
        System.out.println("------------------");

        System.out.println(Arrays.toString(goods));
        System.out.println(indexOfStr);
    }

}
