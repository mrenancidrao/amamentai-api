package com.example.amamentai.api.config.property;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ConfigurationProperties("amamentai")
@PropertySource("classpath:application-${spring.profile}.properties")
public class AmamentaiApiProperty {


	private String originPermitida = "http://localhost:4200";
	
	//private String originPermitida = "https://amamentai.herokuapp.com";
	
	
	private final Seguranca seguranca = new Seguranca();
	
	
	
	public String getOriginPermitida() {
		return originPermitida;
	}



	public void setOriginPermitida(String originPermitida) {
		this.originPermitida = originPermitida;
	}



	public Seguranca getSeguranca() {
		return seguranca;
	}
	
	



	public static class Seguranca {
		private boolean enableHttps;

		public boolean isEnableHttps() {
			return enableHttps;
		}

		public void setEnableHttps(boolean enableHttps) {
			this.enableHttps = enableHttps;
		}
		
		
	}
	
}
