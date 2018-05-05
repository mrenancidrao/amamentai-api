package com.example.amamentai.api.repository.vagenda;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.amamentai.api.model.VAgenda;
import com.example.amamentai.api.repository.filter.VAgendaFilter;


public interface VAgendaRepositoryQuery {

	public Page<VAgenda> filtrar(VAgendaFilter vAgendaFilter, Pageable pageable);
}
