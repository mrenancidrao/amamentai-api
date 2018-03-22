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

	public Cidade atualizar(Integer id, Cidade cidade) {
		Cidade cidadeSalva = buscarCidadePeloId(id);
		
		BeanUtils.copyProperties(cidade, cidadeSalva, "id");
		return cidadeRepository.save(cidadeSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Cidade cidadeSalva = buscarCidadePeloId(id);
		
		cidadeRepository.save(cidadeSalva);
	}
	
	public Cidade buscarCidadePeloId(Integer id) {
		Cidade cidadeSalva = cidadeRepository.findOne(id);
		if (cidadeSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return cidadeSalva;
	}

}
