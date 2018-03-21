package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Cidade;
import com.example.amamentai.api.repository.CidadeRepository;

@Service
public class CidadeService {
	
	@Autowired
	CidadeRepository cidadeRepository;

	public Cidade atualizar(Long id, Cidade cidade) {
		Cidade cidadeSalva = buscarCidadePeloCodigo(id);
		
		BeanUtils.copyProperties(cidade, cidadeSalva, "id");
		return cidadeRepository.save(cidadeSalva);
	}


	public void atualizarPropriedadeAtivo(Long id, Boolean ativo) {
		Cidade cidadeSalva = buscarCidadePeloCodigo(id);
		
		cidadeRepository.save(cidadeSalva);
	}
	
	public Cidade buscarCidadePeloCodigo(Long id) {
		Cidade cidadeSalva = cidadeRepository.findOne(id);
		if (cidadeSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return cidadeSalva;
	}

}
