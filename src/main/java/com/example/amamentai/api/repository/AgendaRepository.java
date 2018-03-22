package com.example.amamentai.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.amamentai.api.model.Agenda;

public interface AgendaRepository extends JpaRepository<Agenda, Integer> {

}
