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
import com.example.amamentai.api.model.Banco;
import com.example.amamentai.api.repository.BancoRepository;
import com.example.amamentai.api.service.BancoService;

@RestController
@RequestMapping("/banco")
public class BancoResource {
	
	@Autowired
	private BancoRepository bancoRepository;
	
	@Autowired
	private BancoService bancoService;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_BANCO') and #oauth2.hasScope('read')")
	public List<Banco> listar() {
		return bancoRepository.findAll();
	}
	
	@PostMapping
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_BANCO') and #oauth2.hasScope('write')")
	public ResponseEntity<Banco> criar(@Valid @RequestBody Banco banco, HttpServletResponse response) {
		Banco bancoSalva = bancoRepository.save(banco);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, bancoSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(bancoSalva);
	}
	
	
	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_BANCO') and #oauth2.hasScope('read')")
	public Banco buscarPeloId(@PathVariable Integer id) {
		return bancoRepository.findOne(id);
	}
	

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_BANCO') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		bancoRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_BANCO') and #oauth2.hasScope('read')")
	public ResponseEntity<Banco> atualizar(@PathVariable Integer id, @Valid @RequestBody Banco banco){
		Banco bancoSalva = bancoService.atualizar(id, banco);
		return ResponseEntity.ok(bancoSalva);
	}

}


