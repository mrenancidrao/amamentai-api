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
@Table(name = "motivo_status_agenda", catalog = "amamentai-api", schema = "public")
public class MotivoStatusAgenda implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "motivo", referencedColumnName = "id")
    @ManyToOne
    private Motivo motivo;
    @JoinColumn(name = "status_agenda", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusAgenda statusAgenda;

    public MotivoStatusAgenda() {
    }

    public MotivoStatusAgenda(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Motivo getMotivo() {
        return motivo;
    }

    public void setMotivo(Motivo motivo) {
        this.motivo = motivo;
    }

    public StatusAgenda getStatusAgenda() {
        return statusAgenda;
    }

    public void setStatusAgenda(StatusAgenda statusAgenda) {
        this.statusAgenda = statusAgenda;
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
        if (!(object instanceof MotivoStatusAgenda)) {
            return false;
        }
        MotivoStatusAgenda other = (MotivoStatusAgenda) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.amamentai.api.model.MotivoStatusAgenda[ id=" + id + " ]";
    }
    
}
