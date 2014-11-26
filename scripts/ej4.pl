#!/usr/bin/perl -w

#system "getorf -minsize 300 -sequence " . $ARGV[0] . " -outseq output/result.orf";
#seteando la base de datos de prosite
#system "sudo prosextract -prositedir /home/jose/biotp1/scripts/prositedir";
#system "patmatmotifs -sequence output/result.orf -outfile output/report.patmatmotifs"
use strict;
use Bio::SeqIO;
use Bio::Factory::EMBOSS;

my $in = Bio::SeqIO->new(-file => "$ARGV[0]", '-format' => 'genBank');
my $fastafilename = "$ARGV[0]" .".fas";
my $out = Bio::SeqIO->new(-file => ">$fastafilename", '-format' => 'Fasta');


#checktrans

while(my $seq = $in->next_seq() ){
        $out->write_seq($seq);
}

my $f = Bio::Factory::EMBOSS -> new();

# get an EMBOSS application  object from the factory
my $getorf = $f->program('getorf');
#my $checktrans = $f->program('checktrans');

my $getorfoutfile = 'output/resultbio1.orf';
$getorf->run({-sequence => $fastafilename,
               -outseq   => $getorfoutfile});

my $file = $getorfoutfile;
open my $info, $file or die "Could not open $file: $!";

my $i=0;
my $j=0;
my $line;
while( $line = <$info>)  {   
    if ($line =~ /^>/){
	print $line;
	my $infile;
	if ( $i != 0 ){
		close FILE;
		my $patmatmotifs = $f->program('patmatmotifs');
		my $k = $j-1;
		my $outfile = "output/ej4/report$j.patmatmotifs";
		$infile = "output/ej4/resultbioinf$k.orf";
		$patmatmotifs->run({-sequence => $infile,
                	        -outfile   => $outfile,
                    		-full => 1 });
	}
	my $aux = "output/ej4/resultbioinf$j.orf";
	unless(open FILE, '>'.$aux) {
		die "Unable to open $aux";
	}
	$j++;
    } 
    print FILE $line;	
    $i++; 
}
close $info;
close FILE;



#my $checktransoutgile = 'output/resultbio2.orf';
#my $checktransoutgileseq = 'output/resultbio2seq.orf';
#$checktrans->run({-sequence => $fastafilename,
#               -outfile   => $checktransoutgile,
#	       -outseq  => $checktransoutgileseq});

#buscando motifs en PROSITE

my $patmatmotifs = $f->program('patmatmotifs');

my $outfile = 'output/report.patmatmotifs';

$patmatmotifs->run({-sequence => $getorfoutfile,
                     -outfile   => $outfile,
		    -full => 1 });
 




