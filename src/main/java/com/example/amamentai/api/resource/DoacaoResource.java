package com.example.amamentai.api.resource;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.ObjectUtils;
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
import com.example.amamentai.api.model.Doadora;
import com.example.amamentai.api.model.DoadoraParto;
import com.example.amamentai.api.repository.DoacaoRepository;
import com.example.amamentai.api.repository.DoadoraPartoRepository;
import com.example.amamentai.api.repository.DoadoraRepository;
import com.example.amamentai.api.service.DoacaoService;
import com.example.amamentai.api.service.DoadoraPartoService;
import com.example.amamentai.api.service.DoadoraService;

@RestController
@RequestMapping("/doacao")
public class DoacaoResource {
	
	@Autowired
	DoacaoRepository doacaoRepository;
	
	@Autowired
	private DoadoraRepository doadoraRepository;
	
	@Autowired
	private DoadoraPartoRepository doadoraPartoRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	@Autowired
	private DoacaoService doacaoService;
	
	@Autowired
	private DoadoraService doadoraService;
	
	@Autowired
	private DoadoraPartoService doadoraPartoService;
	
	@GetMapping
	@PreAuthorize("hasAuthority('ROLE_LISTAR_DOACAO') and #oauth2.hasScope('read')")
	public List<Doacao> listar(){
		return doacaoRepository.findAll();
	}
	
	@PostMapping
	@ResponseBody
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_DOACAO') and #oauth2.hasScope('write')")
	public ResponseEntity<Doacao> criar(@Valid @RequestBody Doacao doacao, HttpServletResponse response){
		Doadora doadoraSalva = new Doadora();
		DoadoraParto doadoraPartoSalva = new DoadoraParto();
		Doacao doacaoSalva = new Doacao();
		
		//SALVA DOADORA
		if (ObjectUtils.isEmpty(doacao.getDoadoraParto().getDoadora().getId()))
			doadoraSalva = doadoraRepository.save(doacao.getDoadoraParto().getDoadora());
		else doadoraSalva = doadoraService.atualizar(doacao.getDoadoraParto().getDoadora().getId(), doacao.getDoadoraParto().getDoadora());
		
		doacao.getDoadoraParto().setDoadora(doadoraSalva);
		
		//SALVA DOADORA PARTO 
		if (ObjectUtils.isEmpty(doacao.getDoadoraParto().getId())) 
			doadoraPartoSalva = doadoraPartoRepository.save(doacao.getDoadoraParto());
		else doadoraPartoSalva = doadoraPartoService.atualizar(doacao.getDoadoraParto().getId(), doacao.getDoadoraParto());
		
		doacao.setDoadoraParto(doadoraPartoSalva);
		
		//SALVA DOACAO 
		//buscar por doacao que tenha doacao.doadoraParto.id = doadoraPartoSalva.id && doacao.banco.id = this.banco.id
		//se não existir, salva doacao nova.. se já existir, faça nada!
		if (ObjectUtils.isEmpty(doacao.getId())) 
			doacaoSalva = doacaoRepository.save(doacao);
		else doacaoSalva = doacaoService.atualizar(doacao.getId(), doacao);
		
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, doadoraSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(doacaoSalva);			
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_PESQUISAR_DOACAO') and #oauth2.hasScope('read')")
	public Doacao buscarPeloId(@PathVariable Integer id) {
		return doacaoRepository.findOne(id);
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('ROLE_REMOVER_DOACAO') and #oauth2.hasScope('write')")
	public void remover(@PathVariable Integer id) {
		doacaoRepository.delete(id);
	}
	
	@PutMapping("/{id}")
	@PreAuthorize("hasAuthority('ROLE_CADASTRAR_DOACAO') and #oauth2.hasScope('read')")
	public ResponseEntity<Doacao> atualizar(@PathVariable Integer id, @Valid @RequestBody Doacao doacao){
		Doacao doacaoSalva = doacaoService.atualizar(id, doacao);
		return ResponseEntity.ok(doacaoSalva);
	}
	

}


