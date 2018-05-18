package com.example.amamentai.api.resource;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
import com.example.amamentai.api.model.StatusAgenda;
import com.example.amamentai.api.repository.StatusAgendaRepository;
import com.example.amamentai.api.repository.filter.StatusAgendaFilter;
import com.example.amamentai.api.service.StatusAgendaService;

@RestController
@RequestMapping("/statusAgenda")
public class StatusAgendaResource {
	
	@Autowired
	StatusAgendaRepository statusAgendaRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private StatusAgendaService statusAgendaService;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_STATUS_AGENDA') and #oauth2.hasScope('read')")
	public Page<StatusAgenda> pesquisar(StatusAgendaFilter agendaFilter, Pageable pageable){
		return statusAgendaRepository.filtrar(agendaFilter, pageable);
	}
	
	@PostMapping
	@ResponseBody
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_STATUS_AGENDA') and #oauth2.hasScope('write')")
	public ResponseEntity<StatusAgenda> criar(@Valid @RequestBody StatusAgenda statusAgenda, HttpServletResponse response){
		StatusAgenda statusAgendaSalva = statusAgendaRepository.save(statusAgenda);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, statusAgendaSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(statusAgendaSalva);			
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_STATUS_AGENDA') and #oauth2.hasScope('read')")
	public StatusAgenda buscarPeloId(@PathVariable Integer id) {
		return statusAgendaRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_STATUS_AGENDA') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		statusAgendaRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_STATUS_AGENDA') and #oauth2.hasScope('read')")
	public ResponseEntity<StatusAgenda> atualizar(@PathVariable Integer id, @Valid @RequestBody StatusAgenda statusAgenda){
		StatusAgenda statusAgendaSalva = statusAgendaService.atualizar(id, statusAgenda);
		return ResponseEntity.ok(statusAgendaSalva);
	}
	

}


