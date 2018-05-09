package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Objetivo;
import com.example.amamentai.api.repository.ObjetivoRepository;

@Service
public class ObjetivoService {
	
	@Autowired
	ObjetivoRepository objetivoRepository;

	public Objetivo atualizar(Integer id, Objetivo objetivo) {
		Objetivo objetivoSalva = buscarObjetivoPeloId(id);
		
		BeanUtils.copyProperties(objetivo, objetivoSalva, "id");
		return objetivoRepository.save(objetivoSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Objetivo objetivoSalva = buscarObjetivoPeloId(id);
		
		objetivoRepository.save(objetivoSalva);
	}
	
	public Objetivo buscarObjetivoPeloId(Integer id) {
		Objetivo objetivoSalva = objetivoRepository.findOne(id);
		if (objetivoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return objetivoSalva;
	}

}
