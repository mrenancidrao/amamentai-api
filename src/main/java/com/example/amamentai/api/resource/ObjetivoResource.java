package com.example.amamentai.api.resource;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.amamentai.api.event.RecursoCriadoEvent;
import com.example.amamentai.api.model.Objetivo;
import com.example.amamentai.api.repository.ObjetivoRepository;
import com.example.amamentai.api.service.ObjetivoService;

@RestController
@RequestMapping("/objetivo")
public class ObjetivoResource {
	
	@Autowired
	private ObjetivoRepository objetivoRepository;
	
	@Autowired
	private ObjetivoService objetivoService;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_OBJETIVO') and #oauth2.hasScope('read')")
	public List<Objetivo> listar() {
		return objetivoRepository.findAll();
	}
	
	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_OBJETIVO') and #oauth2.hasScope('write')")
	public ResponseEntity<Objetivo> criar(@Valid @RequestBody Objetivo objetivo, HttpServletResponse response) {
		Objetivo objetivoSalvo = objetivoRepository.save(objetivo);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, objetivoSalvo.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(objetivoSalvo);
	}
	
	
	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_OBJETIVO') and #oauth2.hasScope('read')")
	public Objetivo buscarPeloId(@PathVariable Integer id) {
		return objetivoRepository.findOne(id);
	}
	

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_OBJETIVO') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		objetivoRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_OBJETIVO') and #oauth2.hasScope('read')")
	public ResponseEntity<Objetivo> atualizar(@PathVariable Integer id, @Valid @RequestBody Objetivo objetivo){
		Objetivo objetivoSalvo = objetivoService.atualizar(id, objetivo);
		return ResponseEntity.ok(objetivoSalvo);
	}

}


