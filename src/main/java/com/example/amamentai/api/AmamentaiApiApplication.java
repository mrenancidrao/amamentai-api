package com.example.amamentai.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.example.amamentai.api.config.property.AmamentaiApiProperty;

@SpringBootApplication
@EnableConfigurationProperties(AmamentaiApiProperty.class)
public class AmamentaiApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(AmamentaiApiApplication.class, args);
	}
}
