/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.amamentai.api.model;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author renan
 */
@Entity
@Table(name = "configuracao", catalog = "amamentai-api", schema = "public")
public class Configuracao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "chave")
    private String chave;
    @Basic(optional = false)
    @Column(name = "valor")
    private String valor;

    public Configuracao() {
    }

    public Configuracao(String chave) {
        this.chave = chave;
    }

    public Configuracao(String chave, String valor) {
        this.chave = chave;
        this.valor = valor;
    }

    public String getChave() {
        return chave;
    }

    public void setChave(String chave) {
        this.chave = chave;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (chave != null ? chave.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Configuracao)) {
            return false;
        }
        Configuracao other = (Configuracao) object;
        if ((this.chave == null && other.chave != null) || (this.chave != null && !this.chave.equals(other.chave))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.amamentai.api.model.Configuracao[ chave=" + chave + " ]";
    }
    
}
