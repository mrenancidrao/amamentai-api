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

	public Bairro atualizar(Integer id, Bairro bairro) {
		Bairro bairroSalva = buscarBairroPeloId(id);
		
		BeanUtils.copyProperties(bairro, bairroSalva, "id");
		return bairroRepository.save(bairroSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Bairro bairroSalva = buscarBairroPeloId(id);
		
		bairroRepository.save(bairroSalva);
	}
	
	public Bairro buscarBairroPeloId(Integer id) {
		Bairro bairroSalva = bairroRepository.findOne(id);
		if (bairroSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return bairroSalva;
	}

}
