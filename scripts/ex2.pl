#!/usr/bin/perl
use strict;
use warnings;
use Bio::Perl;
use Bio::SeqIO;

# create sequence object from the fasta file
my $s = Bio::SeqIO->new(
       -file => $ARGV[0],
       -format => "fasta"
);

while (my $st = $s->next_seq)
{
       # uncomment to print fasta sequence
       # print $st->seq;

       # blast against NCBI blast server (remote)
       my $blast_result = blast_sequence($st->seq);

       # write blast results to the specified file
       write_blast(">$ARGV[1]",$blast_result);
}


