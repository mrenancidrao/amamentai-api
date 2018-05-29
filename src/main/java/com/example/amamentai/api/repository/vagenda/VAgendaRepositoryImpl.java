package com.example.amamentai.api.repository.vagenda;

import java.util.ArrayList;
import java.util.Date;
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

import com.example.amamentai.api.model.Doadora_;
import com.example.amamentai.api.model.Pessoa_;
import com.example.amamentai.api.model.VAgenda;
import com.example.amamentai.api.model.VAgenda_;
import com.example.amamentai.api.repository.filter.VAgendaFilter;

public class VAgendaRepositoryImpl implements VAgendaRepositoryQuery{

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public Page<VAgenda> filtrar(VAgendaFilter vAgendaFilter, Pageable pageable) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<VAgenda> criteria = builder.createQuery(VAgenda.class);
		Root<VAgenda> root = criteria.from(VAgenda.class);
		
		//criar as restrições (predicado)
		Predicate[] predicates = criarRestricoes(vAgendaFilter, builder, root);
		criteria.where(predicates).orderBy(builder.desc(root.get(VAgenda_.dataAgenda)));
		
		
		TypedQuery<VAgenda> query = manager.createQuery(criteria);
		
		adicionarRestricoesDePaginacao(query, pageable);
		
		return new PageImpl<>(query.getResultList(), pageable, total(vAgendaFilter));
		
	}
	



	private Predicate[] criarRestricoes(VAgendaFilter vAgendaFilter, CriteriaBuilder builder, Root<VAgenda> root) {
		
		List<Predicate> predicates = new ArrayList<>();
		if (!StringUtils.isEmpty(vAgendaFilter.getDoadoraNome())) {
			predicates.add(builder.like(
					builder.lower(root.get(VAgenda_.doadoraNome)), "%" + vAgendaFilter.getDoadoraNome().toLowerCase() + "%"));
		}
		
		if (vAgendaFilter.getDataAgenda() != null) {
			predicates.add(builder.equal(root.get(VAgenda_.dataAgenda), vAgendaFilter.getDataAgenda()));
		}
		
		if (vAgendaFilter.getPessoaId() != null) {
			predicates.add(builder.equal(root.get(VAgenda_.pessoaId), vAgendaFilter.getPessoaId()));
		}
		
		if (!StringUtils.isEmpty(vAgendaFilter.getStatus())) {
			predicates.add(builder.equal(
					builder.lower(root.get(VAgenda_.status)), vAgendaFilter.getStatus().toLowerCase()));
		}
		
		
		return predicates.toArray(new Predicate[predicates.size()]);
	}

	private void adicionarRestricoesDePaginacao(TypedQuery<VAgenda> query, Pageable pageable) {
		int paginaAtual = pageable.getPageNumber();
		int totalRegistrosPorPagina = pageable.getPageSize();
		int primeiroRegistroDaPagina = paginaAtual * totalRegistrosPorPagina;
		
		query.setFirstResult(primeiroRegistroDaPagina);
		query.setMaxResults(totalRegistrosPorPagina);
		
		
	}
	private Long total(VAgendaFilter vAgendaFilter) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
		Root<VAgenda> root = criteria.from(VAgenda.class);
		
		Predicate[] predicates = criarRestricoes(vAgendaFilter, builder, root);
		criteria.where(predicates);
		
		criteria.select(builder.count(root));
		return manager.createQuery(criteria).getSingleResult();
	}
}
