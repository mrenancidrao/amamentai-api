package com.example.amamentai.api.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(TipoUsuario.class)
public abstract class TipoUsuario_ {

	public static volatile ListAttribute<TipoUsuario, Permissao> permissoes;
	public static volatile SingularAttribute<TipoUsuario, String> nome;
	public static volatile SingularAttribute<TipoUsuario, Integer> id;

}

