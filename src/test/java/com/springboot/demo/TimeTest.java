package com.springboot.demo;

import org.junit.Test;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

/**
 * @Auther: mingweilin
 * @Date: 5/6/2019 16:28
 * @Description:
 */
public class TimeTest {
    @Test
    public void date() {
        LocalDate begin = LocalDate.of(2018, 11, 1);
        LocalDate today = LocalDate.now();
        System.out.println(begin);
        long days = ChronoUnit.DAYS.between(begin, today);
        System.out.println(days);

    }
}
