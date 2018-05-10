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
import com.example.amamentai.api.model.Rota;
import com.example.amamentai.api.repository.RotaRepository;
import com.example.amamentai.api.service.RotaService;

@RestController
@RequestMapping("/rota")
public class RotaResource {
	
	@Autowired
	private RotaRepository rotaRepository;
	
	@Autowired
	private RotaService rotaService;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_OBJETIVO') and #oauth2.hasScope('read')")
	public List<Rota> listar() {
		return rotaRepository.findAll();
	}
	
	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_OBJETIVO') and #oauth2.hasScope('write')")
	public ResponseEntity<Rota> criar(@Valid @RequestBody Rota rota, HttpServletResponse response) {
		Rota rotaSalvo = rotaRepository.save(rota);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, rotaSalvo.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(rotaSalvo);
	}
	
	
	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_OBJETIVO') and #oauth2.hasScope('read')")
	public Rota buscarPeloId(@PathVariable Integer id) {
		return rotaRepository.findOne(id);
	}
	

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_OBJETIVO') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		rotaRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_OBJETIVO') and #oauth2.hasScope('read')")
	public ResponseEntity<Rota> atualizar(@PathVariable Integer id, @Valid @RequestBody Rota rota){
		Rota rotaSalvo = rotaService.atualizar(id, rota);
		return ResponseEntity.ok(rotaSalvo);
	}

}


