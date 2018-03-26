package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.DoadoraParto;
import com.example.amamentai.api.repository.DoadoraPartoRepository;

@Service
public class DoadoraPartoService {
	
	@Autowired
	DoadoraPartoRepository doadoraPartoRepository;

	public DoadoraParto atualizar(Integer id, DoadoraParto doadoraParto) {
		DoadoraParto doadoraPartoSalva = buscarDoadoraPartoPeloId(id);
		
		BeanUtils.copyProperties(doadoraParto, doadoraPartoSalva, "id");
		return doadoraPartoRepository.save(doadoraPartoSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		DoadoraParto doadoraPartoSalva = buscarDoadoraPartoPeloId(id);
		
		doadoraPartoRepository.save(doadoraPartoSalva);
	}
	
	public DoadoraParto buscarDoadoraPartoPeloId(Integer id) {
		DoadoraParto doadoraPartoSalva = doadoraPartoRepository.findOne(id);
		if (doadoraPartoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return doadoraPartoSalva;
	}

}
