ALTER TABLE doadora ADD COLUMN data_parto date, ADD COLUMN nome_bebe character varying;

ALTER TABLE agenda DROP COLUMN doacao CASCADE;

DROP TABLE doacao CASCADE;

DROP TABLE doadora_parto;

ALTER TABLE agenda ADD COLUMN doadora integer, ADD COLUMN banco integer, 
		ADD CONSTRAINT agenda_doadora_fk FOREIGN KEY (doadora)
		REFERENCES public.doadora (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION, 
		ADD CONSTRAINT agenda_banco_fk FOREIGN KEY (banco)
		REFERENCES public.banco (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION;


