package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.StatusAgenda;
import com.example.amamentai.api.repository.StatusAgendaRepository;

@Service
public class StatusAgendaService {
	
	@Autowired
	StatusAgendaRepository statusAgendaRepository;

	public StatusAgenda atualizar(Integer id, StatusAgenda statusAgenda) {
		StatusAgenda statusAgendaSalva = buscarStatusAgendaPeloId(id);
		
		BeanUtils.copyProperties(statusAgenda, statusAgendaSalva, "id");
		return statusAgendaRepository.save(statusAgendaSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		StatusAgenda statusAgendaSalva = buscarStatusAgendaPeloId(id);
		
		statusAgendaRepository.save(statusAgendaSalva);
	}
	
	public StatusAgenda buscarStatusAgendaPeloId(Integer id) {
		StatusAgenda statusAgendaSalva = statusAgendaRepository.findOne(id);
		if (statusAgendaSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return statusAgendaSalva;
	}

}
