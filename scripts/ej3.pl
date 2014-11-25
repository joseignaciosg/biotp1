#!/usr/bin/perl; 
use strict;

use Bio::Perl;
use Bio::Seq; 
use Bio::SeqIO; 
use Bio::SearchIO;
use Data::Dumper; 

my $regx = $ARGV[1];

my $searchio = new Bio::SearchIO ('-format' => 'blast',
                                 '-file'   => $ARGV[0]);
while ( my $result = $searchio->next_result() ) {
	# Get info about the entire report
	$result->database_name;
	my $algorithm_type =  $result->algorithm;
	# get info about the first hit
	while ( my $hit = $result->next_hit ){
		my $hit_name = $hit->name ;
		# get info about the first hsp of the first hit
		my $hsp = $hit->next_hsp;
		if (defined($hsp)){
			my $hsp_start = $hsp->query->start;
		}
		# get species description	
		my $string = $hit->description();
		my $acc = $hit->accession();
		#search for the specie @description 
		if(index($string, $regx) != -1){
			#print all the information
			while ( (my $khit, my $vhit) = each %{$hit}) { 
		 		 print "$khit => $vhit \n"; 
			}
			while ( (my $khit,my $vhit) = each %{$hsp}) {
			      if ($khit eq "_evalue") {   
     				 print "$khit => $vhit \n";
     				 }  
			}

			my $outfile = "blast-parsed-fasta.fa"; 
			my $outfileformat = 'Fasta';
			my $gb = Bio::DB::GenBank->new(-retrievaltype => 'tempfile' , -format => 'Fasta');
			my $seq_in = $gb->get_Stream_by_acc($acc);
			my $seq_out = Bio::SeqIO->new('-file' => ">>$outfile",'-format' => $outfileformat);
			# write each entry in the input file to the output file 
			while (my $inseq = $seq_in->next_seq) {
        			$seq_out->write_seq($inseq);
			}

		}
	}
}
