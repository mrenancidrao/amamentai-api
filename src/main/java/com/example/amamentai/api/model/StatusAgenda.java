/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.amamentai.api.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author renan
 */
@Entity
@Table(name = "status_agenda", catalog = "amamentai-api", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatusAgenda.findAll", query = "SELECT s FROM StatusAgenda s")
    , @NamedQuery(name = "StatusAgenda.findById", query = "SELECT s FROM StatusAgenda s WHERE s.id = :id")
    , @NamedQuery(name = "StatusAgenda.findByData", query = "SELECT s FROM StatusAgenda s WHERE s.data = :data")
    , @NamedQuery(name = "StatusAgenda.findByObservacao", query = "SELECT s FROM StatusAgenda s WHERE s.observacao = :observacao")})
public class StatusAgenda implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "data")
    @Temporal(TemporalType.DATE)
    private Date data;
    @Column(name = "observacao")
    private String observacao;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "statusAgenda")
    private List<MotivoStatusAgenda> motivoStatusAgendaList;
    @JoinColumn(name = "agenda", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Agenda agenda;
    @JoinColumn(name = "status", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Status status;
    @JoinColumn(name = "usuario", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Usuario usuario;

    public StatusAgenda() {
    }

    public StatusAgenda(Integer id) {
        this.id = id;
    }

    public StatusAgenda(Integer id, Date data) {
        this.id = id;
        this.data = data;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    @XmlTransient
    public List<MotivoStatusAgenda> getMotivoStatusAgendaList() {
        return motivoStatusAgendaList;
    }

    public void setMotivoStatusAgendaList(List<MotivoStatusAgenda> motivoStatusAgendaList) {
        this.motivoStatusAgendaList = motivoStatusAgendaList;
    }

    public Agenda getAgenda() {
        return agenda;
    }

    public void setAgenda(Agenda agenda) {
        this.agenda = agenda;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
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
        if (!(object instanceof StatusAgenda)) {
            return false;
        }
        StatusAgenda other = (StatusAgenda) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.amamentai.api.model.StatusAgenda[ id=" + id + " ]";
    }
    
}
