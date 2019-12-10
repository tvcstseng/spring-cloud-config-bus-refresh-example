package com.springbootdev.springcloud.examples.employeeservice;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = EmployeeServiceApplication.class)
@WebAppConfiguration
public class EmployeeServiceApplicationTests {

	@Test
	public void contextLoads() {
	}

}
