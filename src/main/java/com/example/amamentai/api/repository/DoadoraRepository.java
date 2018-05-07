package com.example.amamentai.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.repository.doadora.DoadoraRepositoryQuery;

public interface DoadoraRepository extends JpaRepository<Doadora, Integer>, DoadoraRepositoryQuery{

}
