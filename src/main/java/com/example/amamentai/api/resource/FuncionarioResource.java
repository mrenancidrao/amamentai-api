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
import com.example.amamentai.api.model.Funcionario;
import com.example.amamentai.api.repository.FuncionarioRepository;
import com.example.amamentai.api.service.FuncionarioService;

@RestController
@RequestMapping("/funcionario")
public class FuncionarioResource {
	
	@Autowired
	FuncionarioRepository funcionarioRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private FuncionarioService funcionarioService;
	
	@GetMapping
	public List<Funcionario> listar(){
		return funcionarioRepository.findAll();
	}
	
	@PostMapping
	@ResponseBody
	public ResponseEntity<Funcionario> criar(@Valid @RequestBody Funcionario funcionario, HttpServletResponse response){
		Funcionario funcionarioSalva = funcionarioRepository.save(funcionario);
		publisher.publishEvent(new RecursoCriadoEvent(this, response, funcionarioSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(funcionarioSalva);			
	}

	@GetMapping("/{id}")
	public Funcionario buscarPeloId(@PathVariable Integer id) {
		return funcionarioRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Integer id) {
		funcionarioRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Funcionario> atualizar(@PathVariable Integer id, @Valid @RequestBody Funcionario funcionario){
		Funcionario funcionarioSalva = funcionarioService.atualizar(id, funcionario);
		return ResponseEntity.ok(funcionarioSalva);
	}
	

}
