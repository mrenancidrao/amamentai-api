package com.example.amamentai.api.repository.filter;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class VAgendaFilter {
	
	private String doadora;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dataAgenda;

	public String getDoadora() {
		return doadora;
	}

	public void setDoadora(String doadora) {
		this.doadora = doadora;
	}

	public LocalDate getDataAgenda() {
		return dataAgenda;
	}

	public void setDataAgenda(LocalDate dataAgenda) {
		this.dataAgenda = dataAgenda;
	}


	
	

}
