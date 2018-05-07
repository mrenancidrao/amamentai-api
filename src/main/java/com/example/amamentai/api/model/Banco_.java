package com.example.amamentai.api.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Banco.class)
public abstract class Banco_ {

	public static volatile SingularAttribute<Banco, String> telefone;
	public static volatile SingularAttribute<Banco, Endereco> endereco;
	public static volatile SingularAttribute<Banco, String> nome;
	public static volatile SingularAttribute<Banco, Integer> id;
	public static volatile SingularAttribute<Banco, String> email;

}

