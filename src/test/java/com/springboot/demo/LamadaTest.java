package com.springboot.demo;

import org.junit.Test;

import java.util.stream.Stream;

/**
 * @Auther: mingweilin
 * @Date: 4/23/2019 10:17
 * @Description:
 */
public class LamadaTest {
    @Test
    public void test2() {
        Stream.iterate(0,n -> n*2).forEach(x -> System.out.println(x+""));
    }
}
