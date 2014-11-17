ex1.pl

Toma una archivo .gb y lo transforma en un nuevo archivo en formato FASTA usando GenBank remotamente.

Se invoca utilizando: Perl ex1.pl archivogb.gb salidafasta.fa

ex2.pl

Toma un archivo formato Fasta y tiene como salida un archivo .out en formato Blast.

Se invoca utilizando: Perl ex2.pl archivofasta.fa archivosalida.out

Recibe como primer parametro el archivo Fasta y como segundo parametro se le indica donde queremos la salida y con que nombre de archivo. Hace un blast de forma remota.

En este caso usamos como archivo Fasta el que corresponde a:

>gi|383216812|gb|AFG73683.1| globulin [Triticum urartu]

Y como resultado obtenemos el blast de la especie que matchea con Triticum urartu y también otras:

Zea mays
Oryza sativa Japonica Group
Triticum aestivum

Entre otras.

ex3.pl

Este ejercicio toma un archivo en formato Blast y devuelve solo las especies que coinciden con la entrada indicada. Para esto parse el archivo y por cada hit del Blast analiza la descripción dónde se indica la especie.

Se invoca utilizando: Perl ex3.pl secuencia.out "Zea mays"

Esto va a devolver todos los que coincidan con la especie Zea mays dentro del archivo secuencia.out

Además generará un archivo "blast-parsed-fasta.fa" con todos los fasta que se generen de esos hits uno debajo del otro.

Este archivo hay que eliminarlo al correr un nuevo ex3.pl ya que esta preparado para apendear los fasta en ese archivo y puede dar lugar a confusiones. (Con un poco más de manejo de archivos en Perl se podría eliminar o ir creando diferentes versiones)