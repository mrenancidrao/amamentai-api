package com.example.amamentai.api.repository.statusagenda;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.amamentai.api.model.StatusAgenda;
import com.example.amamentai.api.repository.filter.StatusAgendaFilter;


public interface StatusAgendaRepositoryQuery {

	public Page<StatusAgenda> filtrar(StatusAgendaFilter statusAgendaFilter, Pageable pageable);
}
