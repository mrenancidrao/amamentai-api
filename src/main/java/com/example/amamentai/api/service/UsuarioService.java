package com.example.amamentai.api.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.example.amamentai.api.model.Usuario;
import com.example.amamentai.api.repository.UsuarioRepository;

@Service
public class UsuarioService {
	
	@Autowired
	UsuarioRepository usuarioRepository;

	public Usuario atualizar(Integer id, Usuario usuario) {
		Usuario usuarioSalva = buscarUsuarioPeloId(id);
		
		BeanUtils.copyProperties(usuario, usuarioSalva, "id");
		return usuarioRepository.save(usuarioSalva);
	}


	public void atualizarPropriedadeAtivo(Integer id, Boolean ativo) {
		Usuario usuarioSalva = buscarUsuarioPeloId(id);
		
		usuarioRepository.save(usuarioSalva);
	}
	
	public Usuario buscarUsuarioPeloId(Integer id) {
		Usuario usuarioSalva = usuarioRepository.findOne(id);
		if (usuarioSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}
		return usuarioSalva;
	}

}
