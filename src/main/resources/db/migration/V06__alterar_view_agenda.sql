

 SELECT a.id,
    b.id as banco_id,
    b.nome as banco_nome,
    pessoa.nome AS doadora_nome,
    obj.nome AS objetivo,
    a.data AS data_agenda,
    (((ds.nome)::text || ' - '::text) || (hr.nome)::text) AS rota,
    sts.nome AS status,
    sa.data AS data_status,
    usu.email AS usuario_status
   FROM (((((((((((agenda a
     JOIN status_agenda sa ON ((sa.id = ( SELECT sa2.id
           FROM status_agenda sa2
          WHERE (sa2.agenda = a.id)
          ORDER BY sa2.data DESC
         LIMIT 1))))
     JOIN status sts ON ((sts.id = sa.status)))
     JOIN objetivo obj ON ((obj.id = a.objetivo)))
     JOIN rota rota ON ((rota.id = a.rota)))
     JOIN dia_semana ds ON ((ds.id = rota.dia_semana)))
     JOIN horario hr ON ((hr.id = rota.horario)))
     JOIN doadora d ON ((d.id = a.doadora)))
     JOIN banco b ON ((b.id = a.banco)))
     JOIN pessoa pessoa ON ((pessoa.id = d.pessoa)))
     JOIN usuario usu ON ((usu.id = sa.usuario))))

     ORDER BY data_agenda desc, doadora_nome 
