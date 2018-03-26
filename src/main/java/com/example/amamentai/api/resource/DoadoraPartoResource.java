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
import com.example.amamentai.api.model.DoadoraParto;
import com.example.amamentai.api.repository.DoadoraPartoRepository;
import com.example.amamentai.api.service.DoadoraPartoService;

@RestController
@RequestMapping("/doadoraParto")
public class DoadoraPartoResource {
	
	@Autowired
	DoadoraPartoRepository doadoraPartoRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private DoadoraPartoService doadoraPartoService;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_DOADORA_PARTO') and #oauth2.hasScope('read')")
	public List<DoadoraParto> listar(){
		return doadoraPartoRepository.findAll();
	}
	
	@PostMapping
	@ResponseBody
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_DOADORA_PARTO') and #oauth2.hasScope('write')")
	public ResponseEntity<DoadoraParto> criar(@Valid @RequestBody DoadoraParto doadoraParto, HttpServletResponse response){
		DoadoraParto doadoraPartoSalva = doadoraPartoRepository.save(doadoraParto);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, doadoraPartoSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(doadoraPartoSalva);			
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_DOADORA_PARTO') and #oauth2.hasScope('read')")
	public DoadoraParto buscarPeloId(@PathVariable Integer id) {
		return doadoraPartoRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_DOADORA_PARTO') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		doadoraPartoRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_DOADORA_PARTO') and #oauth2.hasScope('read')")
	public ResponseEntity<DoadoraParto> atualizar(@PathVariable Integer id, @Valid @RequestBody DoadoraParto doadoraParto){
		DoadoraParto doadoraPartoSalva = doadoraPartoService.atualizar(id, doadoraParto);
		return ResponseEntity.ok(doadoraPartoSalva);
	}
	

}


