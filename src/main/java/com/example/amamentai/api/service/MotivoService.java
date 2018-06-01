package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Motivo;
import com.example.amamentai.api.repository.MotivoRepository;

@Service
public class MotivoService {
	
	@Autowired
	MotivoRepository motivoRepository;

	public Motivo atualizar(Integer id, Motivo motivo) {
		Motivo motivoSalva = buscarMotivoPeloId(id);
		
		BeanUtils.copyProperties(motivo, motivoSalva, "id");
		return motivoRepository.save(motivoSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Motivo motivoSalva = buscarMotivoPeloId(id);
		
		motivoRepository.save(motivoSalva);
	}
	
	public Motivo buscarMotivoPeloId(Integer id) {
		Motivo motivoSalva = motivoRepository.findOne(id);
		if (motivoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return motivoSalva;
	}

}
