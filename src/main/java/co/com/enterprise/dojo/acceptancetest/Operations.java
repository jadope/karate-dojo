package co.com.enterprise.dojo.acceptancetest;

import java.util.Date;

public class Operations {

    public int add(int a, int b) {
        return a + b;
    }

    public int substraction(int a, int b) {
        return a - b;
    }

    public int multiply(int a, int b) {
        return a * b;
    }

    public int division(int a, int b) {
        return a / b;
    }

    public String getDate() {
        return new Date().toString();
    }
}
