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
import com.example.amamentai.api.model.Bairro;
import com.example.amamentai.api.repository.BairroRepository;
import com.example.amamentai.api.service.BairroService;

@RestController
@RequestMapping("/bairro")
public class BairroResource {
	
	@Autowired
	private BairroRepository bairroRepository;
	
	@Autowired
	private BairroService bairroService;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@GetMapping
	public List<Bairro> listar() {
		return bairroRepository.findAll();
	}
	
	@PostMapping
	public ResponseEntity<Bairro> criar(@Valid @RequestBody Bairro bairro, HttpServletResponse response) {
		Bairro bairroSalva = bairroRepository.save(bairro);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, bairroSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(bairroSalva);
	}
	
	@PostMapping("/criarLote")
	public ResponseEntity<List<Bairro>> criarBairro(@Valid @RequestBody List<Bairro> bairros, HttpServletResponse response) {
		
		List<Bairro> bairrosSalvos = new ArrayList<Bairro>();
		
		for (Bairro tmp : bairros) {
			
			Bairro bairroSalva = bairroRepository.save(tmp);
			bairrosSalvos.add(bairroSalva);
		}
		
		
		return ResponseEntity.status(HttpStatus.CREATED).body(bairrosSalvos);
	}
	
	@GetMapping("/{id}")
	public Bairro buscarPeloId(@PathVariable Integer id) {
		return bairroRepository.findOne(id);
	}
	

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Integer id) {
		bairroRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Bairro> atualizar(@PathVariable Integer id, @Valid @RequestBody Bairro bairro){
		Bairro bairroSalva = bairroService.atualizar(id, bairro);
		return ResponseEntity.ok(bairroSalva);
	}

}
