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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.amamentai.api.event.RecursoCriadoEvent;
import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.repository.DoadoraRepository;
import com.example.amamentai.api.service.DoadoraService;

@RestController
@RequestMapping("/doadora")
public class DoadoraResource {
	
	@Autowired
	DoadoraRepository doadoraRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private DoadoraService doadoraService;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_DOADORA') and #oauth2.hasScope('read')")
	public List<Doadora> listar(){
		return doadoraRepository.findAll();
	}
	
	@PostMapping
	@ResponseBody
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_DOADORA') and #oauth2.hasScope('write')")
	public ResponseEntity<Doadora> criar(@Valid @RequestBody Doadora doadora, HttpServletResponse response){
		Doadora doadoraSalva = doadoraRepository.save(doadora);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, doadoraSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(doadoraSalva);			
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_DOADORA') and #oauth2.hasScope('read')")
	public Doadora buscarPeloId(@PathVariable Integer id) {
		return doadoraRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_DOADORA') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		doadoraRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_DOADORA') and #oauth2.hasScope('read')")
	public ResponseEntity<Doadora> atualizar(@PathVariable Integer id, @Valid @RequestBody Doadora doadora){
		Doadora doadoraSalva = doadoraService.atualizar(id, doadora);
		return ResponseEntity.ok(doadoraSalva);
	}
	

}


