DESCRIPCIÓN DE LOS DISTINTOS SCRIPTS

ej1.pl

Dado un archivo .gb como input, lo transforma en un nuevo archivo en formato FASTA usando GenBank (remoto).

Invocacion: perl ej1.pl archivogb.gb fasta.fa

ej2.pl

Dado un archivo formato Fasta como input,da  como outputñ un archivo .out en formato Blast.

Invocacioin: perl ej2.pl fasta.fa blast.out

Recibe como primer parametro el archivo Fasta y como segundo parametro se le indica donde queremos la salida y con que nombre de archivo. Hace un blast de forma remota.

En este caso usamos como archivo Fasta el que corresponde a:

>gi|383216812|gb|AFG73683.1| globulin [Triticum urartu]

Y como resultado obtenemos el blast de la especie que matchea con Triticum urartu y también otras:

Zea mays
Oryza sativa Japonica Group
Triticum aestivum

Entre otras.

ej3.pl

Dado un archivo en formato Blast como input, devuelve solo las especies que coinciden con la entrada indicada. Para esto parse el archivo y por cada hit del Blast analiza la descripción dónde se indica la especie.

Se invoca utilizando: perl ej3.pl secuencia.out "Zea mays"

Esto va a devolver todos los que coincidan con la especie Zea mays dentro del archivo secuencia.out

Además generará un archivo "blast-parsed-fasta.fa" con todos los fasta que se generen de esos hits uno debajo del otro.

Este archivo hay que eliminarlo al correr un nuevo ex3.pl ya que esta preparado para apendear los fasta en ese archivo y puede dar lugar a confusiones. (Con un poco más de manejo de archivos en Perl se podría eliminar o ir creando diferentes versiones)
