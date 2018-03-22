package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Agenda;
import com.example.amamentai.api.repository.AgendaRepository;

@Service
public class AgendaService {
	
	@Autowired
	AgendaRepository agendaRepository;

	public Agenda atualizar(Integer id, Agenda agenda) {
		Agenda agendaSalva = buscarAgendaPeloId(id);
		
		BeanUtils.copyProperties(agenda, agendaSalva, "id");
		return agendaRepository.save(agendaSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Agenda agendaSalva = buscarAgendaPeloId(id);
		
		agendaRepository.save(agendaSalva);
	}
	
	public Agenda buscarAgendaPeloId(Integer id) {
		Agenda agendaSalva = agendaRepository.findOne(id);
		if (agendaSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return agendaSalva;
	}

}
