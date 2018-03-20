package com.example.amamentai.api.resource;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.amamentai.api.event.RecursoCriadoEvent;
import com.example.amamentai.api.model.Cidade;
import com.example.amamentai.api.repository.CidadeRepository;

@RestController
@RequestMapping("/cidades")
public class CidadeResource {
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@GetMapping
	public List<Cidade> listar() {
		return cidadeRepository.findAll();
	}
	
	@PostMapping
	public ResponseEntity<Cidade> criar(@Valid @RequestBody Cidade cidade, HttpServletResponse response) {
		Cidade cidadeSalva = cidadeRepository.save(cidade);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, cidadeSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(cidadeSalva);
	}
	
	@GetMapping("/{id}")
	public Cidade buscarPeloCodigo(@PathVariable Long id) {
		return cidadeRepository.findOne(id);
	}

}
