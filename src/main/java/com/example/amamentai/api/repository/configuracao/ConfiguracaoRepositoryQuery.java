package com.example.amamentai.api.repository.configuracao;

import com.example.amamentai.api.model.Configuracao;
import com.example.amamentai.api.repository.filter.ConfiguracaoFilter;


public interface ConfiguracaoRepositoryQuery {

	public Configuracao filtrar(ConfiguracaoFilter configuracaoFilter);
	
	public Configuracao filtrarPorChave(String chave);
}
