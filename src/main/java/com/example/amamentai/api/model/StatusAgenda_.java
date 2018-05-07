package com.example.amamentai.api.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(StatusAgenda.class)
public abstract class StatusAgenda_ {

	public static volatile SingularAttribute<StatusAgenda, String> observacao;
	public static volatile SingularAttribute<StatusAgenda, Date> data;
	public static volatile SingularAttribute<StatusAgenda, Usuario> usuario;
	public static volatile SingularAttribute<StatusAgenda, Integer> id;
	public static volatile SingularAttribute<StatusAgenda, Agenda> agenda;
	public static volatile SingularAttribute<StatusAgenda, Status> status;

}

