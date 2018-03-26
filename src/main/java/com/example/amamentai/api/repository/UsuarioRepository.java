package com.example.amamentai.api.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.amamentai.api.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
	
	public Optional<Usuario> findByEmail(String email);

}
