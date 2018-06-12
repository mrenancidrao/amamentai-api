package com.example.amamentai.api.resource;

import java.util.Calendar;
import java.util.Date;
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
import com.example.amamentai.api.model.Agenda;
import com.example.amamentai.api.model.MotivoStatusAgenda;
import com.example.amamentai.api.model.Status;
import com.example.amamentai.api.model.StatusAgenda;
import com.example.amamentai.api.model.Usuario;
import com.example.amamentai.api.repository.AgendaRepository;
import com.example.amamentai.api.repository.MotivoStatusAgendaRepository;
import com.example.amamentai.api.repository.StatusAgendaRepository;
import com.example.amamentai.api.service.AgendaService;

@RestController
@RequestMapping("/agenda")
public class AgendaResource {
	
	@Autowired
	AgendaRepository agendaRepository;
	
	@Autowired
	private StatusAgendaRepository statusAgendaRepository;
	
	@Autowired
	private MotivoStatusAgendaRepository motivoStatusAgendaRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private AgendaService agendaService;
	
		
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_AGENDA') and #oauth2.hasScope('read')")
	public List<Agenda> listar(){
		return agendaRepository.findAll();
	}
	
	@PostMapping
	@ResponseBody
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_AGENDA') and #oauth2.hasScope('write')")
	public ResponseEntity<Agenda> criar(@Valid @RequestBody Agenda agenda, HttpServletResponse response){
		
		StatusAgenda statusAgenda = new StatusAgenda();
		
		//GAMBIARA AJEITAR DEPOIS
		Calendar c = Calendar.getInstance();
		c.setTime(agenda.getData());
		c.add(Calendar.DATE, +1);
		
		agenda.setData(c.getTime());
		
		Agenda agendaSalva = agendaRepository.save(agenda);
		
		statusAgenda.setAgenda(agendaSalva);
		statusAgenda.setData(new Date());
		statusAgenda.setStatus(new Status(new Integer(1)));
		statusAgenda.setUsuario(new Usuario(new Integer(4)));
		statusAgendaRepository.save(statusAgenda);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, agendaSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(agendaSalva);			
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_AGENDA') and #oauth2.hasScope('read')")
	public Agenda buscarPeloId(@PathVariable Integer id) {
		return agendaRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_AGENDA') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		agendaRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_AGENDA') and #oauth2.hasScope('read')")
	public ResponseEntity<Agenda> atualizar(@PathVariable Integer id, @Valid @RequestBody Agenda agenda){
		Agenda agendaSalva = agendaService.atualizar(id, agenda);
		return ResponseEntity.ok(agendaSalva);
	}
	
	
	@PutMapping("/{id}/confirmar")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void confirmarAgenda(@PathVariable Integer id, @Valid @RequestBody Integer usuarioId) {
		Agenda agenda = agendaRepository.findOne(id);
		
		StatusAgenda statusAgenda = new StatusAgenda();
		statusAgenda.setAgenda(agenda);
		statusAgenda.setData(new Date());
		statusAgenda.setStatus(new Status(new Integer(2)));
		statusAgenda.setUsuario(new Usuario(new Integer(usuarioId)));
		
		statusAgendaRepository.save(statusAgenda);
	}
	
	@PostMapping("/cancelar")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void cancelarAgenda(@Valid @RequestBody MotivoStatusAgenda params) {
		
		StatusAgenda statusAgenda = new StatusAgenda();
		statusAgenda.setAgenda(params.getStatusAgenda().getAgenda());
		statusAgenda.setData(new Date());
		statusAgenda.setStatus(new Status(new Integer(3)));
		statusAgenda.setUsuario(params.getStatusAgenda().getUsuario());
		
		statusAgendaRepository.save(statusAgenda);
		
		params.setStatusAgenda(statusAgenda);
		motivoStatusAgendaRepository.save(params);
		
	}
	
}


