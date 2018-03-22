package com.example.amamentai.api.resource;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.amamentai.api.event.RecursoCriadoEvent;
import com.example.amamentai.api.model.Cidade;
import com.example.amamentai.api.repository.CidadeRepository;
import com.example.amamentai.api.service.CidadeService;

@RestController
@RequestMapping("/cidade")
public class CidadeResource {
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	@Autowired
	private CidadeService cidadeService;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@GetMapping
	public List<Cidade> listar() {
		return cidadeRepository.findAll();
	}
	
	@PostMapping
	public ResponseEntity<Cidade> criar(@Valid @RequestBody Cidade cidade, HttpServletResponse response) {
		Cidade cidadeSalva = cidadeRepository.save(cidade);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, cidadeSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(cidadeSalva);
	}
	
	@PostMapping("/criarLote")
	public ResponseEntity<List<Cidade>> criarCidades(@Valid @RequestBody List<Cidade> cidades, HttpServletResponse response) {
		
		List<Cidade> cidadesSalvos = new ArrayList<Cidade>();
		
		for (Cidade tmp : cidades) {
			
			Cidade cidadeSalva = cidadeRepository.save(tmp);
			cidadesSalvos.add(cidadeSalva);
		}
		
		
		return ResponseEntity.status(HttpStatus.CREATED).body(cidadesSalvos);
	}
	
	@GetMapping("/{id}")
	public Cidade buscarPeloId(@PathVariable Integer id) {
		return cidadeRepository.findOne(id);
	}
	

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Integer id) {
		cidadeRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Cidade> atualizar(@PathVariable Integer id, @Valid @RequestBody Cidade cidade){
		Cidade cidadeSalva = cidadeService.atualizar(id, cidade);
		return ResponseEntity.ok(cidadeSalva);
	}

}
