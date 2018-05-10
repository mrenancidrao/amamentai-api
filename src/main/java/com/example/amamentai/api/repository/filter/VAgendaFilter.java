package com.example.amamentai.api.repository.filter;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class VAgendaFilter {
	
	private String doadoraNome;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dataAgenda;
	

	public String getDoadoraNome() {
		return doadoraNome;
	}

	public void setDoadoraNome(String doadoraNome) {
		this.doadoraNome = doadoraNome;
	}

	public LocalDate getDataAgenda() {
		return dataAgenda;
	}

	public void setDataAgenda(LocalDate dataAgenda) {
		this.dataAgenda = dataAgenda;
	}


	
	

}
