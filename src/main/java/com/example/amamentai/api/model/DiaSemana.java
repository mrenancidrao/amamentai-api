/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.amamentai.api.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author renan
 */
@Entity
@Table(name = "dia_semana", catalog = "amamentai-api", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DiaSemana.findAll", query = "SELECT d FROM DiaSemana d")
    , @NamedQuery(name = "DiaSemana.findById", query = "SELECT d FROM DiaSemana d WHERE d.id = :id")
    , @NamedQuery(name = "DiaSemana.findByNome", query = "SELECT d FROM DiaSemana d WHERE d.nome = :nome")})
public class DiaSemana implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "diaSemana")
    private List<Rota> rotaList;

    public DiaSemana() {
    }

    public DiaSemana(Integer id) {
        this.id = id;
    }

    public DiaSemana(Integer id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @XmlTransient
    public List<Rota> getRotaList() {
        return rotaList;
    }

    public void setRotaList(List<Rota> rotaList) {
        this.rotaList = rotaList;
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
        if (!(object instanceof DiaSemana)) {
            return false;
        }
        DiaSemana other = (DiaSemana) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.amamentai.api.model.DiaSemana[ id=" + id + " ]";
    }
    
}
