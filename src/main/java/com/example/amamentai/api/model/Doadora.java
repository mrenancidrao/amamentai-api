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
@Table(name = "doadora", catalog = "amamentai-api", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Doadora.findAll", query = "SELECT d FROM Doadora d")
    , @NamedQuery(name = "Doadora.findById", query = "SELECT d FROM Doadora d WHERE d.id = :id")
    , @NamedQuery(name = "Doadora.findByAtivo", query = "SELECT d FROM Doadora d WHERE d.ativo = :ativo")})
public class Doadora implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "ativo")
    private Boolean ativo;
    @JoinColumn(name = "pessoa", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Pessoa pessoa;
    @OneToMany(mappedBy = "doadora")
    private List<Doacao> doacaoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "doadora")
    private List<FilhoDoadora> filhoDoadoraList;

    public Doadora() {
    }

    public Doadora(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    @XmlTransient
    public List<Doacao> getDoacaoList() {
        return doacaoList;
    }

    public void setDoacaoList(List<Doacao> doacaoList) {
        this.doacaoList = doacaoList;
    }

    @XmlTransient
    public List<FilhoDoadora> getFilhoDoadoraList() {
        return filhoDoadoraList;
    }

    public void setFilhoDoadoraList(List<FilhoDoadora> filhoDoadoraList) {
        this.filhoDoadoraList = filhoDoadoraList;
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
        if (!(object instanceof Doadora)) {
            return false;
        }
        Doadora other = (Doadora) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.amamentai.api.model.Doadora[ id=" + id + " ]";
    }
    
}
