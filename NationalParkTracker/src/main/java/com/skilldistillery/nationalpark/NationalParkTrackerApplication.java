package com.skilldistillery.nationalpark;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class NationalParkTrackerApplication extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(NationalParkTrackerApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(NationalParkTrackerApplication.class, args);
	}

}
