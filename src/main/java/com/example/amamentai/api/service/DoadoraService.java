package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.repository.DoadoraRepository;

@Service
public class DoadoraService {
	
	@Autowired
	DoadoraRepository doadoraRepository;

	public Doadora atualizar(Long id, Doadora doadora) {
		Doadora doadoraSalva = buscarDoadoraPeloCodigo(id);
		
		BeanUtils.copyProperties(doadora, doadoraSalva, "id");
		return doadoraRepository.save(doadoraSalva);
	}


	public void atualizarPropriedadeAtivo(Long id, Boolean ativo) {
		Doadora doadoraSalva = buscarDoadoraPeloCodigo(id);
		
		doadoraRepository.save(doadoraSalva);
	}
	
	public Doadora buscarDoadoraPeloCodigo(Long id) {
		Doadora doadoraSalva = doadoraRepository.findOne(id);
		if (doadoraSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return doadoraSalva;
	}

}
