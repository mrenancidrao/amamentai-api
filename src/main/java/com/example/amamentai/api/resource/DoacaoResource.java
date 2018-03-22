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
import com.example.amamentai.api.model.Doacao;
import com.example.amamentai.api.repository.DoacaoRepository;
import com.example.amamentai.api.service.DoacaoService;

@RestController
@RequestMapping("/doacao")
public class DoacaoResource {
	
	@Autowired
	DoacaoRepository doacaoRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private DoacaoService doacaoService;
	
	@GetMapping
	public List<Doacao> listar(){
		return doacaoRepository.findAll();
	}
	
	@PostMapping
	@ResponseBody
	public ResponseEntity<Doacao> criar(@Valid @RequestBody Doacao doacao, HttpServletResponse response){
		Doacao doacaoSalva = doacaoRepository.save(doacao);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, doacaoSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(doacaoSalva);			
	}

	@GetMapping("/{id}")
	public Doacao buscarPeloId(@PathVariable Integer id) {
		return doacaoRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Integer id) {
		doacaoRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Doacao> atualizar(@PathVariable Integer id, @Valid @RequestBody Doacao doacao){
		Doacao doacaoSalva = doacaoService.atualizar(id, doacao);
		return ResponseEntity.ok(doacaoSalva);
	}
	

}
