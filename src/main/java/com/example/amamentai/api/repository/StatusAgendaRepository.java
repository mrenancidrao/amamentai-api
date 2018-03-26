package com.example.amamentai.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.amamentai.api.model.StatusAgenda;
import com.example.amamentai.api.repository.statusagenda.StatusAgendaRepositoryQuery;

public interface StatusAgendaRepository extends JpaRepository<StatusAgenda, Integer>, StatusAgendaRepositoryQuery{

}
