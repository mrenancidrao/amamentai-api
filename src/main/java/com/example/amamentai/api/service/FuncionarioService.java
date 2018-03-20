package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Funcionario;
import com.example.amamentai.api.repository.FuncionarioRepository;

@Service
public class FuncionarioService {
	
	@Autowired
	FuncionarioRepository funcionarioRepository;

	public Funcionario atualizar(Long id, Funcionario funcionario) {
		Funcionario funcionarioSalva = buscarFuncionarioPeloCodigo(id);
		
		BeanUtils.copyProperties(funcionario, funcionarioSalva, "id");
		return funcionarioRepository.save(funcionarioSalva);
	}


	public void atualizarPropriedadeAtivo(Long id, Boolean ativo) {
		Funcionario funcionarioSalva = buscarFuncionarioPeloCodigo(id);
		
		funcionarioRepository.save(funcionarioSalva);
	}
	
	public Funcionario buscarFuncionarioPeloCodigo(Long id) {
		Funcionario funcionarioSalva = funcionarioRepository.findOne(id);
		if (funcionarioSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return funcionarioSalva;
	}

}
