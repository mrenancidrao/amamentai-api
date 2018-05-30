package com.example.amamentai.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.amamentai.api.model.Configuracao;
import com.example.amamentai.api.repository.configuracao.ConfiguracaoRepositoryQuery;

public interface ConfiguracaoRepository extends JpaRepository<Configuracao, Integer>, ConfiguracaoRepositoryQuery{

}
