package com.example.amamentai.api.resource;

import java.util.ArrayList;
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
import com.example.amamentai.api.model.Estado;
import com.example.amamentai.api.repository.EstadoRepository;
import com.example.amamentai.api.service.EstadoService;

@RestController
@RequestMapping("/estado")
public class EstadoResource {
	
	@Autowired
	private EstadoRepository estadoRepository;
	
	@Autowired
	private EstadoService estadoService;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_ESTADO') and #oauth2.hasScope('read')")
	public List<Estado> listar() {
		return estadoRepository.findAll();
	}
	
	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_ESTADO') and #oauth2.hasScope('write')")
	public ResponseEntity<Estado> criar(@Valid @RequestBody Estado estado, HttpServletResponse response) {
		Estado estadoSalva = estadoRepository.save(estado);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, estadoSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(estadoSalva);
	}
	
	@PostMapping("/criarLote")
	public ResponseEntity<List<Estado>> criarEstados(@Valid @RequestBody List<Estado> estados, HttpServletResponse response) {
		
		List<Estado> estadosSalvos = new ArrayList<Estado>();
		
		for (Estado tmp : estados) {
			
			Estado estadoSalva = estadoRepository.save(tmp);
			estadosSalvos.add(estadoSalva);
		}
		
		
		return ResponseEntity.status(HttpStatus.CREATED).body(estadosSalvos);
	}
	
	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_ESTADO') and #oauth2.hasScope('read')")
	public Estado buscarPeloId(@PathVariable Integer id) {
		return estadoRepository.findOne(id);
	}
	

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_ESTADO') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		estadoRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_ESTADO') and #oauth2.hasScope('read')")
	public ResponseEntity<Estado> atualizar(@PathVariable Integer id, @Valid @RequestBody Estado estado){
		Estado estadoSalva = estadoService.atualizar(id, estado);
		return ResponseEntity.ok(estadoSalva);
	}

}


