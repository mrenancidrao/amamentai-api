package com.example.amamentai.api.repository.statusagenda;

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

import com.example.amamentai.api.model.StatusAgenda;
import com.example.amamentai.api.model.StatusAgenda_;
import com.example.amamentai.api.repository.filter.StatusAgendaFilter;



public class StatusAgendaRepositoryImpl implements StatusAgendaRepositoryQuery{

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public Page<StatusAgenda> filtrar(StatusAgendaFilter statusAgendaFilter, Pageable pageable) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<StatusAgenda> criteria = builder.createQuery(StatusAgenda.class);
		Root<StatusAgenda> root = criteria.from(StatusAgenda.class);
		
		//criar as restrições (predicado)
		Predicate[] predicates = criarRestricoes(statusAgendaFilter, builder, root);
		criteria.where(predicates);
		
		TypedQuery<StatusAgenda> query = manager.createQuery(criteria);
		
		adicionarRestricoesDePaginacao(query, pageable);
		
		return new PageImpl<>(query.getResultList(), pageable, total(statusAgendaFilter));
		
	}
	



	private Predicate[] criarRestricoes(StatusAgendaFilter statusAgendaFilter, CriteriaBuilder builder, Root<StatusAgenda> root) {
		
		List<Predicate> predicates = new ArrayList<>();
		
		if (statusAgendaFilter.getStatus()!=null) {
			predicates.add(builder.equal(root.get(StatusAgenda_.status), statusAgendaFilter.getStatus()));
		}
		
		return predicates.toArray(new Predicate[predicates.size()]);
	}

	private void adicionarRestricoesDePaginacao(TypedQuery<StatusAgenda> query, Pageable pageable) {
		int paginaAtual = pageable.getPageNumber();
		int totalRegistrosPorPagina = pageable.getPageSize();
		int primeiroRegistroDaPagina = paginaAtual * totalRegistrosPorPagina;
		
		query.setFirstResult(primeiroRegistroDaPagina);
		query.setMaxResults(totalRegistrosPorPagina);
		
		
	}
	private Long total(StatusAgendaFilter statusAgendaFilter) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
		Root<StatusAgenda> root = criteria.from(StatusAgenda.class);
		
		Predicate[] predicates = criarRestricoes(statusAgendaFilter, builder, root);
		criteria.where(predicates);
		
		criteria.select(builder.count(root));
		return manager.createQuery(criteria).getSingleResult();
	}
}
