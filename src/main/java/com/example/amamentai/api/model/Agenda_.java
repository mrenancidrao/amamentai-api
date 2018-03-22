package com.example.amamentai.api.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Agenda.class)
public abstract class Agenda_ {

	public static volatile SingularAttribute<Agenda, Objetivo> objetivo;
	public static volatile SingularAttribute<Agenda, Date> data;
	public static volatile SingularAttribute<Agenda, Doacao> doacao;
	public static volatile SingularAttribute<Agenda, Usuario> usuario;
	public static volatile SingularAttribute<Agenda, Integer> id;
	public static volatile SingularAttribute<Agenda, Rota> rota;

}

