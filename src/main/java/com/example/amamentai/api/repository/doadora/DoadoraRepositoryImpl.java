package com.example.amamentai.api.repository.doadora;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.util.StringUtils;

import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.model.Doadora_;
import com.example.amamentai.api.model.Pessoa_;
import com.example.amamentai.api.repository.filter.DoadoraFilter;

public class DoadoraRepositoryImpl implements DoadoraRepositoryQuery{

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public Page<Doadora> filtrar(DoadoraFilter doadoraFilter, Pageable pageable) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Doadora> criteria = builder.createQuery(Doadora.class);
		Root<Doadora> root = criteria.from(Doadora.class);
		
		//criar as restrições (predicado)
		Predicate[] predicates = criarRestricoes(doadoraFilter, builder, root);
		criteria.where(predicates);
		
		TypedQuery<Doadora> query = manager.createQuery(criteria);
		
		adicionarRestricoesDePaginacao(query, pageable);
		
		return new PageImpl<>(query.getResultList(), pageable, total(doadoraFilter));
		
	}
	



	private Predicate[] criarRestricoes(DoadoraFilter doadoraFilter, CriteriaBuilder builder, Root<Doadora> root) {
		
		List<Predicate> predicates = new ArrayList<>();
		
		if (!StringUtils.isEmpty(doadoraFilter.getNome())) {
			predicates.add(builder.like(
					builder.lower(root.get(Doadora_.pessoa).get(Pessoa_.nome)), "%" + doadoraFilter.getNome().toLowerCase() + "%"));
		}
		
		if (doadoraFilter.getPessoaId()!=null) {
			predicates.add(builder.equal(root.get(Doadora_.pessoa).get(Pessoa_.id), doadoraFilter.getPessoaId()));
		}
		
		
		return predicates.toArray(new Predicate[predicates.size()]);
	}

	private void adicionarRestricoesDePaginacao(TypedQuery<Doadora> query, Pageable pageable) {
		int paginaAtual = pageable.getPageNumber();
		int totalRegistrosPorPagina = pageable.getPageSize();
		int primeiroRegistroDaPagina = paginaAtual * totalRegistrosPorPagina;
		
		query.setFirstResult(primeiroRegistroDaPagina);
		query.setMaxResults(totalRegistrosPorPagina);
		
		
	}
	private Long total(DoadoraFilter doadoraFilter) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
		Root<Doadora> root = criteria.from(Doadora.class);
		
		Predicate[] predicates = criarRestricoes(doadoraFilter, builder, root);
		criteria.where(predicates);
		
		criteria.select(builder.count(root));
		return manager.createQuery(criteria).getSingleResult();
	}
}
