package com.example.amamentai.api.repository.configuracao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.example.amamentai.api.model.Configuracao;
import com.example.amamentai.api.model.Configuracao_;
import com.example.amamentai.api.repository.filter.ConfiguracaoFilter;



public class ConfiguracaoRepositoryImpl implements ConfiguracaoRepositoryQuery{

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public Configuracao filtrar(ConfiguracaoFilter configuracaoFilter) {
		Configuracao configuracao = null;
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Configuracao> criteria = builder.createQuery(Configuracao.class);
		Root<Configuracao> root = criteria.from(Configuracao.class);
		
		//criar as restrições (predicado)
		Predicate[] predicates = criarRestricoes(configuracaoFilter, builder, root);
		criteria.where(predicates);
		
		TypedQuery<Configuracao> query = manager.createQuery(criteria);
		
		
		configuracao = query.getResultList().get(0);
		
		return configuracao;
		
	}
	

	private Predicate[] criarRestricoes(ConfiguracaoFilter configuracaoFilter, CriteriaBuilder builder, Root<Configuracao> root) {
		
		List<Predicate> predicates = new ArrayList<>();
		
		if (configuracaoFilter.getChave()!=null) {
			predicates.add(builder.equal(root.get(Configuracao_.chave), configuracaoFilter.getChave()));
		}
		
		if (configuracaoFilter.getValor()!=null) {
			predicates.add(builder.equal(root.get(Configuracao_.valor), configuracaoFilter.getValor()));
		}
		
		return predicates.toArray(new Predicate[predicates.size()]);
	}


	@Override
	public Configuracao filtrarPorChave(String chave) {
		Configuracao configuracao = null;
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Configuracao> criteria = builder.createQuery(Configuracao.class);
		Root<Configuracao> root = criteria.from(Configuracao.class);
		
		//criar as restrições (predicado)
		List<Predicate> predicatesLst = new ArrayList<>();
		predicatesLst.add(builder.equal(root.get(Configuracao_.chave), chave));
		
		
		Predicate[] predicates = predicatesLst.toArray(new Predicate[predicatesLst.size()]);
		
		
		
		criteria.where(predicates);
		
		TypedQuery<Configuracao> query = manager.createQuery(criteria);
		
		
		configuracao = query.getResultList().get(0);
		
		return configuracao;
	}
}
