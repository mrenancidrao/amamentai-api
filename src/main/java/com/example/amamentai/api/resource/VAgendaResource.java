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
import com.example.amamentai.api.model.VAgenda;
import com.example.amamentai.api.repository.VAgendaRepository;
import com.example.amamentai.api.repository.filter.VAgendaFilter;
import com.example.amamentai.api.service.VAgendaService;

@RestController
@RequestMapping("/vAgenda")
public class VAgendaResource {
	
	@Autowired
	VAgendaRepository vAgendaRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private VAgendaService vAgendaService;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_STATUS_AGENDA') and #oauth2.hasScope('read')")
	public Page<VAgenda> pesquisar(VAgendaFilter vAgendaFilter, Pageable pageable){
		return vAgendaRepository.filtrar(vAgendaFilter, pageable);
	}
	
	@PostMapping
	@ResponseBody
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_STATUS_AGENDA') and #oauth2.hasScope('write')")
	public ResponseEntity<VAgenda> criar(@Valid @RequestBody VAgenda vAgenda, HttpServletResponse response){
		VAgenda vAgendaSalva = vAgendaRepository.save(vAgenda);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, vAgendaSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(vAgendaSalva);			
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_STATUS_AGENDA') and #oauth2.hasScope('read')")
	public VAgenda buscarPeloId(@PathVariable Integer id) {
		return vAgendaRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_STATUS_AGENDA') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		vAgendaRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_STATUS_AGENDA') and #oauth2.hasScope('read')")
	public ResponseEntity<VAgenda> atualizar(@PathVariable Integer id, @Valid @RequestBody VAgenda vAgenda){
		VAgenda vAgendaSalva = vAgendaService.atualizar(id, vAgenda);
		return ResponseEntity.ok(vAgendaSalva);
	}
	

}


