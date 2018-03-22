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

	public Funcionario atualizar(Integer id, Funcionario funcionario) {
		Funcionario funcionarioSalva = buscarFuncionarioPeloId(id);
		
		BeanUtils.copyProperties(funcionario, funcionarioSalva, "id");
		return funcionarioRepository.save(funcionarioSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Funcionario funcionarioSalva = buscarFuncionarioPeloId(id);
		
		funcionarioRepository.save(funcionarioSalva);
	}
	
	public Funcionario buscarFuncionarioPeloId(Integer id) {
		Funcionario funcionarioSalva = funcionarioRepository.findOne(id);
		if (funcionarioSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return funcionarioSalva;
	}

}
