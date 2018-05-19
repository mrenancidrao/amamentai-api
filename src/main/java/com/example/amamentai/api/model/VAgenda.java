/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.amamentai.api.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author renan
 */
@Entity
@Table(name = "v_agenda")
public class VAgenda implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id")
    private Integer id;
    @Column(name = "banco_id")
    private Integer bancoId;
    @Column(name = "banco_nome")
    private String bancoNome;
    @Column(name = "pessoa_id")
    private Integer pessoaId;
    @Column(name = "doadora_nome")
    private String doadoraNome;
    @Column(name = "objetivo")
    private String objetivo;
    @Column(name = "data_agenda")
    private LocalDate dataAgenda;
    @Column(name = "rota")
    private String rota;
    @Column(name = "status")
    private String status;
    @Column(name = "data_status")
    @Temporal(TemporalType.DATE)
    private Date dataStatus;
    @Column(name = "usuario_status")
    private String usuarioStatus;

    public VAgenda() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public LocalDate getDataAgenda() {
        return dataAgenda;
    }

    public void setDataAgenda(LocalDate dataAgenda) {
        this.dataAgenda = dataAgenda;
    }

    public String getRota() {
        return rota;
    }

    public void setRota(String rota) {
        this.rota = rota;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDataStatus() {
        return dataStatus;
    }

    public void setDataStatus(Date dataStatus) {
        this.dataStatus = dataStatus;
    }

    public String getUsuarioStatus() {
        return usuarioStatus;
    }

    public void setUsuarioStatus(String usuarioStatus) {
        this.usuarioStatus = usuarioStatus;
    }

	public Integer getBancoId() {
		return bancoId;
	}

	public void setBancoId(Integer bancoId) {
		this.bancoId = bancoId;
	}

	public String getBancoNome() {
		return bancoNome;
	}

	public void setBancoNome(String bancoNome) {
		this.bancoNome = bancoNome;
	}
	

	public Integer getPessoaId() {
		return pessoaId;
	}

	public void setPessoaId(Integer pessoaId) {
		this.pessoaId = pessoaId;
	}

	public String getDoadoraNome() {
		return doadoraNome;
	}

	public void setDoadoraNome(String doadoraNome) {
		this.doadoraNome = doadoraNome;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    
    
}
