package com.example.amamentai.api.config.property;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("amamentai")
public class AmamentaiApiProperty {

	private String originPermitida = "http://localhost:8080";
	
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
		private boolean enableHttps = true;

		public boolean isEnableHttps() {
			return enableHttps;
		}

		public void setEnableHttps(boolean enableHttps) {
			this.enableHttps = enableHttps;
		}
		
		
	}
	
}
