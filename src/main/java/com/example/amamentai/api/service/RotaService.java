package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Rota;
import com.example.amamentai.api.repository.RotaRepository;

@Service
public class RotaService {
	
	@Autowired
	RotaRepository rotaRepository;

	public Rota atualizar(Integer id, Rota rota) {
		Rota rotaSalva = buscarRotaPeloId(id);
		
		BeanUtils.copyProperties(rota, rotaSalva, "id");
		return rotaRepository.save(rotaSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Rota rotaSalva = buscarRotaPeloId(id);
		
		rotaRepository.save(rotaSalva);
	}
	
	public Rota buscarRotaPeloId(Integer id) {
		Rota rotaSalva = rotaRepository.findOne(id);
		if (rotaSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return rotaSalva;
	}

}
