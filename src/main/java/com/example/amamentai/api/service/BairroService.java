package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Bairro;
import com.example.amamentai.api.repository.BairroRepository;

@Service
public class BairroService {
	
	@Autowired
	BairroRepository bairroRepository;

	public Bairro atualizar(Long id, Bairro bairro) {
		Bairro bairroSalva = buscarBairroPeloCodigo(id);
		
		BeanUtils.copyProperties(bairro, bairroSalva, "id");
		return bairroRepository.save(bairroSalva);
	}


	public void atualizarPropriedadeAtivo(Long id, Boolean ativo) {
		Bairro bairroSalva = buscarBairroPeloCodigo(id);
		
		bairroRepository.save(bairroSalva);
	}
	
	public Bairro buscarBairroPeloCodigo(Long id) {
		Bairro bairroSalva = bairroRepository.findOne(id);
		if (bairroSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return bairroSalva;
	}

}
