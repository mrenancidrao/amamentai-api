package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Pessoa;
import com.example.amamentai.api.repository.PessoaRepository;

@Service
public class PessoaService {
	
	@Autowired
	PessoaRepository pessoaRepository;

	public Pessoa atualizar(Integer id, Pessoa pessoa) {
		Pessoa pessoaSalva = buscarPessoaPeloId(id);
		
		BeanUtils.copyProperties(pessoa, pessoaSalva, "id");
		return pessoaRepository.save(pessoaSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Pessoa pessoaSalva = buscarPessoaPeloId(id);
		
		pessoaRepository.save(pessoaSalva);
	}
	
	public Pessoa buscarPessoaPeloId(Integer id) {
		Pessoa pessoaSalva = pessoaRepository.findOne(id);
		if (pessoaSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return pessoaSalva;
	}

}
