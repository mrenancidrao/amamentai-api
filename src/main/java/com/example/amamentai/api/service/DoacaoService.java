package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Doacao;
import com.example.amamentai.api.repository.DoacaoRepository;

@Service
public class DoacaoService {
	
	@Autowired
	DoacaoRepository doacaoRepository;

	public Doacao atualizar(Integer id, Doacao doacao) {
		Doacao doacaoSalva = buscarDoacaoPeloId(id);
		
		BeanUtils.copyProperties(doacao, doacaoSalva, "id");
		return doacaoRepository.save(doacaoSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Doacao doacaoSalva = buscarDoacaoPeloId(id);
		
		doacaoRepository.save(doacaoSalva);
	}
	
	public Doacao buscarDoacaoPeloId(Integer id) {
		Doacao doacaoSalva = doacaoRepository.findOne(id);
		if (doacaoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return doacaoSalva;
	}

}
