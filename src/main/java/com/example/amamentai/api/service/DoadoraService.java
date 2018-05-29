package com.example.amamentai.api.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.repository.DoadoraRepository;

@Service
public class DoadoraService {
	
	@Autowired
	DoadoraRepository doadoraRepository;

	public Doadora atualizar(Integer id, Doadora doadora) {
		Doadora doadoraSalva = buscarDoadoraPeloId(id);
		
		BeanUtils.copyProperties(doadora, doadoraSalva, "id");
		return doadoraRepository.save(doadoraSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Doadora doadoraSalva = buscarDoadoraPeloId(id);
		
		doadoraRepository.save(doadoraSalva);
	}
	
	public Doadora buscarDoadoraPeloId(Integer id) {
		Doadora doadoraSalva = doadoraRepository.findOne(id);
		if (doadoraSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return doadoraSalva;
	}
	
	public List<Doadora> buscarTodas() {
		return doadoraRepository.findAll();
	}
	
	public List<Map<String, Object>> report() {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for (Doadora doadora : this.buscarTodas()) {
			Map<String, Object> d = new HashMap<String, Object>();
			d.put("id", doadora.getId());
			d.put("nome", doadora.getPessoa().getNome());
			d.put("dataParto", doadora.getDataParto());
			d.put("nomeBebe", doadora.getNomeBebe());
			result.add(d);
		}
		return result;
	}

}
