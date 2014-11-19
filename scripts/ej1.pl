#!/usr/bin/perl -w
use strict;
use Bio::SeqIO;

my $in = Bio::SeqIO->new(-file => "$ARGV[0]", '-format' => 'genBank');
my $out = Bio::SeqIO->new(-file => ">$ARGV[1]", '-format' => 'Fasta');

while(my $seq = $in->next_seq() ){
        $out->write_seq($seq);
}
