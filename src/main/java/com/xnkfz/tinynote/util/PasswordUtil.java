package com.xnkfz.tinynote.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtil {
    private static final BCryptPasswordEncoder ENCODER = new BCryptPasswordEncoder();

    // 加密密码
    public static String encode(String rawPassword) {
        return ENCODER.encode(rawPassword);
    }

    // 验证密码
    public static boolean matches(String rawPassword, String encodedPassword) {
        return ENCODER.matches(rawPassword, encodedPassword);
    }

    public static void main(String[] args) {
        String rawPassword = "123456";
        String encodedPassword = encode(rawPassword);
        System.out.println(encodedPassword);
    }
}
