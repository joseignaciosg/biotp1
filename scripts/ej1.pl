#!/usr/bin/perl -w
use strict;
use Bio::SeqIO;
use Bio::SeqUtils;
use Bio::Tools::CodonTable;
use Bio::Tools::SeqStats;
use Bio::CodonUsage::Table;
use Getopt::Long;


my $in = Bio::SeqIO->new(-file => "$ARGV[0]", '-format' => 'genBank');
my $out1 = Bio::SeqIO->new(-file => ">output/out-0F", '-format' => 'Fasta');
my $out2 = Bio::SeqIO->new(-file => ">output/out-1F", '-format' => 'Fasta');
my $out3 = Bio::SeqIO->new(-file => ">output/out-2F", '-format' => 'Fasta');
my $out4 = Bio::SeqIO->new(-file => ">output/out-0R", '-format' => 'Fasta');
my $out5 = Bio::SeqIO->new(-file => ">output/out-1R", '-format' => 'Fasta');
my $out6 = Bio::SeqIO->new(-file => ">output/out-2R", '-format' => 'Fasta');

my @seqs = Bio::SeqUtils->translate_6frames($in->next_seq());


$out1->write_seq($seqs[0]);
$out2->write_seq($seqs[1]);
$out3->write_seq($seqs[2]);
$out4->write_seq($seqs[3]);
$out5->write_seq($seqs[4]);
$out6->write_seq($seqs[5]);


