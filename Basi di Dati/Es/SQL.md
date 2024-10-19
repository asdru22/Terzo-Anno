| Nome      | NomeCapitale | Superficie | Continente |
| --------- | ------------ | ---------- | ---------- |
| Italia    | Roma         | 1          | Europa     |
| Francia   | Parigi       | 2          | Europa     |
| Nigeria   | Lagos        | 3          | Africa     |
| Brasile   | Brasilia     | 4          | America    |
| Cina      | Pechino      | 5          | Asia       |
| Svezia    | NULL         | 6          | Europa     |
| Australia | NULL         | 7          | Oceania    |
## 2.6
```SQL
Select C.Nome
from Circolo as C
where (NumeroCampiTennis > 3)
and C.Nome not in (
 select S.NomeCircolo
 from SOCIO as S
)
```

```SQL
select C.Nome
from Circolo as C
where (NumeroCampiTennis > 3)
and not exists(
    select * 
    from SOCIO as s
    where S.NomeCircolo = C.Nome
)
``` 

## 3.1
```SQL
select Nome, Cognome
from SOCIO
where AnnoNascita > 1992
and NomeCircolo in (
    select Nome
    from CIRCOLO
    where Citta = "Bologna"
    )
``` 

Usa il prodotto cartesiano
```sql 
select S.Nome, S.Cognome
from SOCIO as S, CIRCOLO as C
where S.AnnoNascita > 1992 and 
    S.NomeCircolo = C.Nome and
    Citta = "Bologna"
``` 