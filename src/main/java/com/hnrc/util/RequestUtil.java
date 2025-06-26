package com.hnrc.util;

import javax.servlet.http.HttpServletRequest;

public class RequestUtil {

    public static void checkAndSleep(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");

        try {
            if (userAgent != null && userAgent.toLowerCase().contains("bot")) {
                Thread.sleep(3000);
            } else {
                int sleepTime = 100 + (int)(Math.random() * 400);
                Thread.sleep(sleepTime);
            }
        } catch (InterruptedException e) {
            // InterruptedException 처리
            Thread.currentThread().interrupt();
        }
    }
}

