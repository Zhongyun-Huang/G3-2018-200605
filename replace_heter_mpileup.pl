#!/usr/bin/perl -w
# 2015-01-26 replace heter via counting heter ratio by mpileup

open(R,"new_group.txt")||die $!;
# 206	omd01	outgroup	outgroup	ACGATA	2
while (<R>) {
	if (/id/) {next;}
    chomp;
    @g=split;
    $line=$g[5];
       if($line==5) {$line=~s/5/2/;}
    elsif($line==4) {$line=~s/4/8/;}
    elsif($line==1) {$line=~s/1/4/;}
    elsif($line==2) {$line=~s/2/5/;}
    # $subg{$g[4].'-s_'.$line}=$g[3].'_'.$g[1];
    $bam{$g[3].'_'.$g[1]}=$g[4].'-s_'.$line;
}
close(R);

open(W,">region_snp_noheter.txt");
open(R,"region_snp.txt")||die $!;
while (<R>) {
	chomp;
	@a=split;	
	if (/contigs/) {
		print W "$_\n";
		push @head,@a;
	}
	else{
		print W "$a[0]\t$a[1]\t$a[2]";
		$region="$a[0]:$a[1]-$a[1]";
		for (my $i = 3; $i < @a; $i++) {
			if ($a[$i] eq 'NA') { print W "\tNA";}
			elsif ($a[$i]=~/,/) {
##################################################################
				$input=$bam{$head[$i]}.'-sort.bam';
				system("samtools mpileup -f msu6.fa -r $region $input >try.mpileup");
				open(F,"try.mpileup")||die $!;
			# 1 22374119	A   132  g$G$G$gGGgGGgGGGGGGGgggGGgGGgGGggGGGgGggggggGgGGGGGGGGggGgggGGgGggGGGggggggGgGGGgGGgGGGggG
				while (<F>) {
					chomp;
					@b=split;
					$ref=$b[2];	$bases=$b[4];
					$bases=~s/\./$ref/g;	$bases=~s/,/$ref/g;
					$count_a=$bases=~tr/Aa/Aa/;
					$count_t=$bases=~tr/Tt/Tt/;
					$count_g=$bases=~tr/Gg/Gg/;
					$count_c=$bases=~tr/Cc/Cc/;
				    $ratio{'A'}=$count_a/$b[3];
				    $ratio{'T'}=$count_t/$b[3];
				    $ratio{'G'}=$count_g/$b[3];
				    $ratio{'C'}=$count_c/$b[3];
				}
				close(F);
########################################################################
				foreach	(sort {$ratio{$b} <=> $ratio{$a}} keys %ratio) {
					$h=$_;
				}
				print W "\t$h";
			}
			elsif ($a[$i]=~/(\w)_homo/) { print W "\t$1";}
		}
		print W "\n";
	}
}
close(R);
close(W);