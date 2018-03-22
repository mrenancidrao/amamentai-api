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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author renan
 */
@Entity
@Table(name = "filho_doadora", catalog = "amamentai-api", schema = "public")
public class FilhoDoadora implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "doadora", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Doadora doadora;
    @JoinColumn(name = "filho", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Filho filho;

    public FilhoDoadora() {
    }

    public FilhoDoadora(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Doadora getDoadora() {
        return doadora;
    }

    public void setDoadora(Doadora doadora) {
        this.doadora = doadora;
    }

    public Filho getFilho() {
        return filho;
    }

    public void setFilho(Filho filho) {
        this.filho = filho;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FilhoDoadora)) {
            return false;
        }
        FilhoDoadora other = (FilhoDoadora) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.amamentai.api.model.FilhoDoadora[ id=" + id + " ]";
    }
    
}
