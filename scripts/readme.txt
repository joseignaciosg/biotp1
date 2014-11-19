DESCRIPCIÓN DE LOS DISTINTOS SCRIPTS

Elegimos el siguiente gen para realizar el trabajo:

DSCR3 Down syndrome critical region 3 [ Homo sapiens (human) ]

Se trata del gen asociado con el síndrome de Down. 

ej1.pl

Dado un archivo .gb como input, lo transforma en un nuevo archivo en formato FASTA usando GenBank (remoto).

Invocacion: perl ej1.pl archivo.gb fasta.fa


ej2.pl

Dado un archivo formato Fasta como input,da  como output un archivo .out en formato Blast.

Invocacion: perl ej2.pl fasta.fa blast.out

Hace un blast de forma remota.

En este caso usamos como archivo Fasta el que corresponde a:


Entre otras.

ej3.pl

Dado un archivo en formato Blast como input, devuelve solo las especies que coinciden con la entrada indicada. Para esto parse el archivo y por cada hit del Blast analiza la descripción dónde se indica la especie.

Además generará un archivo "blast-parsed-fasta.fa" con todos los fasta que se generen de esos hits uno debajo del otro.
