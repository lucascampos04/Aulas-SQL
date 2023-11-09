create table boletim(
  id int generated always as identity primary key,
	nota1 float,
    nota2 float,
    nota4 float,
    media float,
    status varchar(20)
);

select id, media, status from boletim;

DECLARE
    n_random FLOAT;
    n1 FLOAT;
    n2 FLOAT;
    n4 FLOAT;
    media FLOAT;
    status VARCHAR2(30); 
BEGIN
    n_random := trunc(DBMS_RANDOM.VALUE(1, 10));
    n1 := n_random;
    n2 := n_random;
    n4 := n_random;
    
    media := (n1 + n2 + n4) / 4;

    IF media < 4 THEN
        dbms_output.put_line('Reprovado! Média : ' || media);
        status := 'reprovado';
    ELSIF media < 7 THEN
        dbms_output.put_line('Recuperação! Média : ' || media);
        status := 'recuperação';
    ELSIF media > 8 THEN
        dbms_output.put_line('Aprovado! Média : ' || media);
        status := 'aprovado';
    ELSE
        dbms_output.put_line('ERRO OPÇÃO INVALIDA');
    END IF;

    INSERT INTO boletim (nota1, nota2, nota4, media, status) 
    VALUES (n1, n2, n4, media, status);

    dbms_output.put_line('Inserção concluída com sucesso!');
END;