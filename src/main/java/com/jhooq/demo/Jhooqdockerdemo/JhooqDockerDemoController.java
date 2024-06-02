package com.jhooq.demo.Jhooqdockerdemo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JhooqDockerDemoController {


    @GetMapping("/")
    public String main() {
        return "V3 - 2024-06-02 15:30";
    }

    @GetMapping("/hello")
    public String hello() {
        return "Docker Demo - Hello Rassil";
    }

}
