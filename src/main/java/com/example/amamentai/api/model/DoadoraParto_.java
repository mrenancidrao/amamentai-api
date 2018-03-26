package com.example.amamentai.api.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(DoadoraParto.class)
public abstract class DoadoraParto_ {

	public static volatile SingularAttribute<DoadoraParto, Date> dataParto;
	public static volatile SingularAttribute<DoadoraParto, Integer> id;
	public static volatile SingularAttribute<DoadoraParto, String> nomeBebe;
	public static volatile SingularAttribute<DoadoraParto, Doadora> doadora;

}

