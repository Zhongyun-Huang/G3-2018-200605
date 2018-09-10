#!/usr/bin/perl -w
# yaling 2015-04-28 change group name and narrow down sample

open(R,"group4.txt")||die $!;
# wild_parent_group	ACTTGA	3	241
while (<R>) {
    chomp;
    @g = split;
    $lane = $g[2];
       if($lane == 5) {$lane=~s/5/2/;}
    elsif($lane == 4) {$lane=~s/4/8/;}
    elsif($lane == 1) {$lane=~s/1/4/;}
    elsif($lane == 2) {$lane=~s/2/5/;}

    $g{$g[1]."-s_".$lane} = $g[0].'_'.$g[3];
}
close(R);

open(W,">merge_group_unmap_snp.txt");
open(T,"merge_unmap.txt")||die $!;
while (<T>) {
	chomp;
	@a=split;
	if (/contigs/) {
		print W "contigs\tloc\tref";
		for (my $var = 3; $var < @a; $var++) {
			if (exists $g{$a[$var]}) {
				print W "\t$g{$a[$var]}";
				push @new,$var;
			}
		}
		print W "\n";
	}
	else{
		print W	"$a[0]\t$a[1]\t$a[2]";
		foreach my $x (@new) {
			print W "\t$a[$x]";
		}
		print W "\n";
	}
}
close(T);
close(W);