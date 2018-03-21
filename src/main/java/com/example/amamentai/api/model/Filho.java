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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "filho", catalog = "amamentai-api", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Filho.findAll", query = "SELECT f FROM Filho f")
    , @NamedQuery(name = "Filho.findById", query = "SELECT f FROM Filho f WHERE f.id = :id")})
public class Filho implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "filho")
    private List<FilhoDoadora> filhoDoadoraList;
    @JoinColumn(name = "pessoa", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Pessoa pessoa;

    public Filho() {
    }

    public Filho(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @XmlTransient
    public List<FilhoDoadora> getFilhoDoadoraList() {
        return filhoDoadoraList;
    }

    public void setFilhoDoadoraList(List<FilhoDoadora> filhoDoadoraList) {
        this.filhoDoadoraList = filhoDoadoraList;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
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
        if (!(object instanceof Filho)) {
            return false;
        }
        Filho other = (Filho) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.amamentai.api.model.Filho[ id=" + id + " ]";
    }
    
}
