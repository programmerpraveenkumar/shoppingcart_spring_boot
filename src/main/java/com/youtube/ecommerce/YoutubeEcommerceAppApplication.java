package com.youtube.ecommerce;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication
public class YoutubeEcommerceAppApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(YoutubeEcommerceAppApplication.class, args);
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(YoutubeEcommerceAppApplication.class);
	}

}
