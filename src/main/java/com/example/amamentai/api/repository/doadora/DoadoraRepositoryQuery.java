package com.example.amamentai.api.repository.doadora;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.repository.filter.DoadoraFilter;


public interface DoadoraRepositoryQuery {

	public Page<Doadora> filtrar(DoadoraFilter doadoraFilter, Pageable pageable);
}
