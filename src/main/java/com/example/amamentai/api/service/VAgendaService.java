package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.VAgenda;
import com.example.amamentai.api.repository.VAgendaRepository;

@Service
public class VAgendaService {
	
	@Autowired
	VAgendaRepository vAgendaRepository;

	public VAgenda atualizar(Integer id, VAgenda vAgenda) {
		VAgenda vAgendaSalva = buscarVAgendaPeloId(id);
		
		BeanUtils.copyProperties(vAgenda, vAgendaSalva, "id");
		return vAgendaRepository.save(vAgendaSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		VAgenda vAgendaSalva = buscarVAgendaPeloId(id);
		
		vAgendaRepository.save(vAgendaSalva);
	}
	
	public VAgenda buscarVAgendaPeloId(Integer id) {
		VAgenda vAgendaSalva = vAgendaRepository.findOne(id);
		if (vAgendaSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return vAgendaSalva;
	}

}
