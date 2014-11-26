#!/usr/bin/perl -w

system "getorf -minsize 300 -sequence " . $ARGV[0] . " -outseq output/result.orf";


#seteando la base de datos de prosite
system "sudo prosextract -prositedir /home/jose/biotp1/scripts/prositedir";



system "patmatmotifs -sequence output/result.orf -outfile output/report.patmatmotifs"
