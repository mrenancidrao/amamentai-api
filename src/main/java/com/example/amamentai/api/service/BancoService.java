package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Banco;
import com.example.amamentai.api.repository.BancoRepository;

@Service
public class BancoService {
	
	@Autowired
	BancoRepository bancoRepository;

	public Banco atualizar(Integer id, Banco banco) {
		Banco bancoSalva = buscarBancoPeloId(id);
		
		BeanUtils.copyProperties(banco, bancoSalva, "id");
		return bancoRepository.save(bancoSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Banco bancoSalva = buscarBancoPeloId(id);
		
		bancoRepository.save(bancoSalva);
	}
	
	public Banco buscarBancoPeloId(Integer id) {
		Banco bancoSalva = bancoRepository.findOne(id);
		if (bancoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return bancoSalva;
	}

}
