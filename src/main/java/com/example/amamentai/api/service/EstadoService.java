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

	public Estado atualizar(Integer id, Estado estado) {
		Estado estadoSalva = buscarEstadoPeloId(id);
		
		BeanUtils.copyProperties(estado, estadoSalva, "id");
		return estadoRepository.save(estadoSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Estado estadoSalva = buscarEstadoPeloId(id);
		
		estadoRepository.save(estadoSalva);
	}
	
	public Estado buscarEstadoPeloId(Integer id) {
		Estado estadoSalva = estadoRepository.findOne(id);
		if (estadoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return estadoSalva;
	}

}
