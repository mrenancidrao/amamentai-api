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
import com.example.amamentai.api.model.Agenda;
import com.example.amamentai.api.repository.AgendaRepository;
import com.example.amamentai.api.service.AgendaService;

@RestController
@RequestMapping("/agenda")
public class AgendaResource {
	
	@Autowired
	AgendaRepository agendaRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private AgendaService agendaService;
	
	@GetMapping
	public List<Agenda> listar(){
		return agendaRepository.findAll();
	}
	
	@PostMapping
	@ResponseBody
	public ResponseEntity<Agenda> criar(@Valid @RequestBody Agenda agenda, HttpServletResponse response){
		Agenda agendaSalva = agendaRepository.save(agenda);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, agendaSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(agendaSalva);			
	}

	@GetMapping("/{id}")
	public Agenda buscarPeloId(@PathVariable Integer id) {
		return agendaRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Integer id) {
		agendaRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Agenda> atualizar(@PathVariable Integer id, @Valid @RequestBody Agenda agenda){
		Agenda agendaSalva = agendaService.atualizar(id, agenda);
		return ResponseEntity.ok(agendaSalva);
	}
	

}
