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
import com.example.amamentai.api.model.Motivo;
import com.example.amamentai.api.repository.MotivoRepository;
import com.example.amamentai.api.service.MotivoService;

@RestController
@RequestMapping("/motivo")
public class MotivoResource {
	
	@Autowired
	private MotivoRepository motivoRepository;
	
	@Autowired
	private MotivoService motivoService;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_MOTIVO') and #oauth2.hasScope('read')")
	public List<Motivo> listar() {
		return motivoRepository.findAll();
	}
	
	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_MOTIVO') and #oauth2.hasScope('write')")
	public ResponseEntity<Motivo> criar(@Valid @RequestBody Motivo motivo, HttpServletResponse response) {
		Motivo motivoSalvo = motivoRepository.save(motivo);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, motivoSalvo.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(motivoSalvo);
	}
	
	
	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_MOTIVO') and #oauth2.hasScope('read')")
	public Motivo buscarPeloId(@PathVariable Integer id) {
		return motivoRepository.findOne(id);
	}
	

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_MOTIVO') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		motivoRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_MOTIVO') and #oauth2.hasScope('read')")
	public ResponseEntity<Motivo> atualizar(@PathVariable Integer id, @Valid @RequestBody Motivo motivo){
		Motivo motivoSalvo = motivoService.atualizar(id, motivo);
		return ResponseEntity.ok(motivoSalvo);
	}

}


