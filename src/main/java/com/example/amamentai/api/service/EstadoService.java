package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Estado;
import com.example.amamentai.api.repository.EstadoRepository;

@Service
public class EstadoService {
	
	@Autowired
	EstadoRepository estadoRepository;

	public Estado atualizar(Long id, Estado estado) {
		Estado estadoSalva = buscarEstadoPeloCodigo(id);
		
		BeanUtils.copyProperties(estado, estadoSalva, "id");
		return estadoRepository.save(estadoSalva);
	}


	public void atualizarPropriedadeAtivo(Long id, Boolean ativo) {
		Estado estadoSalva = buscarEstadoPeloCodigo(id);
		
		estadoRepository.save(estadoSalva);
	}
	
	public Estado buscarEstadoPeloCodigo(Long id) {
		Estado estadoSalva = estadoRepository.findOne(id);
		if (estadoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return estadoSalva;
	}

}
