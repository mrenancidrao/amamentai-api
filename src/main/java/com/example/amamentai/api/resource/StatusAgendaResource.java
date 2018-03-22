package com.example.amamentai.api.resource;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	public List<StatusAgenda> listar(){
		return statusAgendaRepository.findAll();
	}
	
	@PostMapping
	@ResponseBody
	public ResponseEntity<StatusAgenda> criar(@Valid @RequestBody StatusAgenda statusAgenda, HttpServletResponse response){
		StatusAgenda statusAgendaSalva = statusAgendaRepository.save(statusAgenda);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, statusAgendaSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(statusAgendaSalva);			
	}

	@GetMapping("/{id}")
	public StatusAgenda buscarPeloId(@PathVariable Integer id) {
		return statusAgendaRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Integer id) {
		statusAgendaRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<StatusAgenda> atualizar(@PathVariable Integer id, @Valid @RequestBody StatusAgenda statusAgenda){
		StatusAgenda statusAgendaSalva = statusAgendaService.atualizar(id, statusAgenda);
		return ResponseEntity.ok(statusAgendaSalva);
	}
	

}
