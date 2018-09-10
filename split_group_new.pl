#!/perl -w
# yl 2016/03/16
use strict;
my (%fh, %group);
open R, "region_snp.txt";
while (<R>) {
	chomp;
    my @a = split;
	if (/contig/) {
	    for (my $i = 3; $i < @a; $i++) {
	    	push @{$group{$1}}, $i if $a[$i] =~ /(\S+)_\w+$/;
	    }
	    foreach my $group (sort keys %group) {
	    	open $fh{$group}, ">$group.group";
	    }
	}
	foreach my $group (sort keys %group) {
		$fh{$group} -> print("$a[0]\t$a[1]\t$a[2]");
		foreach my $index (@{$group{$group}}) {
			$fh{$group} -> print("\t$a[$index]");
		}
		$fh{$group} -> print("\n");
	}
}
close R;
close $fh{$_} foreach (keys %group);
