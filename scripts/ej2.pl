#!/usr/bin/perl
use strict;
use warnings;
use Bio::Perl;
use Bio::SeqIO;


# create sequence object from the fasta file
my @s;
my $i=0;
while ($i < @ARGV )
{
 $s[$i] = Bio::SeqIO->new(
  -file => $ARGV[$i],
  -format => "fasta"
 );

 while (my $st = $s[$i]->next_seq)
 {
        # print $st->seq;
 
        # against NCBI blast server (remote)
        my $blast_result = blast_sequence($st->seq);

        # write blast results to the specified file
        write_blast(">output/ej2/blast$i.out",$blast_result);
 }
 $i++;
}

