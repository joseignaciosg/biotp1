#!/usr/bin/perl -w

#system "getorf -minsize 300 -sequence " . $ARGV[0] . " -outseq output/result.orf";
#seteando la base de datos de prosite
#system "sudo prosextract -prositedir /home/jose/biotp1/scripts/prositedir";
#system "patmatmotifs -sequence output/result.orf -outfile output/report.patmatmotifs"
use strict;
use Bio::SeqIO;
use Bio::Factory::EMBOSS;

#primero paso el archivo a fasta 
my $in = Bio::SeqIO->new(-file => "$ARGV[0]", '-format' => 'genBank');
my $fastafilename = "$ARGV[0]" .".fas";
my $out = Bio::SeqIO->new(-file => ">$fastafilename", '-format' => 'Fasta');

while(my $seq = $in->next_seq() ){
        $out->write_seq($seq);
}

my $f = Bio::Factory::EMBOSS -> new();

# get an EMBOSS application  object from the factory
my $getorf = $f->program('getorf');

my $getorfoutfile = 'output/resultbio1.orf';
$getorf->run({-sequence => $fastafilename,
               -outseq   => $getorfoutfile});

