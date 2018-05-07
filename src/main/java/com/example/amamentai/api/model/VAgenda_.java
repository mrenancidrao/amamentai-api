package com.example.amamentai.api.model;

import java.time.LocalDate;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(VAgenda.class)
public abstract class VAgenda_ {

	public static volatile SingularAttribute<VAgenda, String> objetivo;
	public static volatile SingularAttribute<VAgenda, String> usuarioStatus;
	public static volatile SingularAttribute<VAgenda, Integer> doacao;
	public static volatile SingularAttribute<VAgenda, Date> dataStatus;
	public static volatile SingularAttribute<VAgenda, Integer> id;
	public static volatile SingularAttribute<VAgenda, String> doadora;
	public static volatile SingularAttribute<VAgenda, LocalDate> dataAgenda;
	public static volatile SingularAttribute<VAgenda, String> rota;
	public static volatile SingularAttribute<VAgenda, String> status;

}

