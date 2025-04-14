package com.sashabrava.demodocker;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
class DemoRestController {

  @Value("${devOps}")
  private String devOpsValue;

  @GetMapping("/function1")
  String function1() {
    return "Function 1";
  }

  @GetMapping("/function2")
  String function2() {
    return String.format("Function 2: %s", devOpsValue);
  }
}
