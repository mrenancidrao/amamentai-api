/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.amamentai.api.model;

import java.io.Serializable;
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
    @Column(name = "doacao")
    private Integer doacao;
    @Column(name = "doadora")
    private String doadora;
    @Column(name = "objetivo")
    private String objetivo;
    @Column(name = "data_agenda")
    @Temporal(TemporalType.DATE)
    private Date dataAgenda;
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

    public Integer getDoacao() {
        return doacao;
    }

    public void setDoacao(Integer doacao) {
        this.doacao = doacao;
    }

    public String getDoadora() {
        return doadora;
    }

    public void setDoadora(String doadora) {
        this.doadora = doadora;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public Date getDataAgenda() {
        return dataAgenda;
    }

    public void setDataAgenda(Date dataAgenda) {
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
    
}
