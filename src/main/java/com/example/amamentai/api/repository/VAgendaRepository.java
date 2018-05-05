package com.example.amamentai.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.amamentai.api.model.VAgenda;
import com.example.amamentai.api.repository.vagenda.VAgendaRepositoryQuery;

public interface VAgendaRepository extends JpaRepository<VAgenda, Integer>, VAgendaRepositoryQuery{

}
