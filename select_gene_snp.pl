#!/perl-w
#@SQ	SN:scaffold_950	LN:5583
##length
 
open(R,"header.txt");
while(<R>){
	chomp;
	if(/SN:(\w+)\s+LN:(\d+)/){
		$ln{$1}=$2;
		$scaffold{$1}=1;}}
			close(R);
######

open(R,"merge_group_unmap_snp.txt");
open(W,">region_snp.txt");
while(<R>){if(/contigs/){print W "$_";}
	
	chomp;
	@a=split;


	$info{$a[0]."\t"."$a[1]"}=$_;
		}
close(R);


######split loc
foreach(sort keys %scaffold){
    	%ID={};
	%start={};
	%en={};
	%s={};
	$in=1;$scaff=$_;
	open(R1,"select_cover_region_for_select_snp.txt");
	while(<R1>){
		chomp;
		
	
		@gff=split;
	if($gff[0] ne $scaff){next;}
	$ID_name{$in}=$gff[1];
 
	$ID{$in}=$gff[0];
	$start{$in}=$gff[2];
	$en{$in}=$gff[3];
	$in++	
		
	}
	close(R1);
open(R2,"merge_group_unmap_snp.txt");
	while(<R2>){
	if(/contigs/){next;}
	chomp;
	@snp=split;
	if($snp[0] ne $scaff){
		next;}
	$s{$snp[1]}=$_;
		
   }
   close(R2);
   $m=$in-1;
   $n=1;
   foreach(sort {$a<=>$b} keys %s){
   	if($_>$en{$m}){last;}
   	if($_<$start{$n}){next;}
   	while($_>$en{$n}){
  
   $n++;	}
   if($_<=$en{$n} and $_>=$start{$n}){
 if($s{$_}){
 	print W "$s{$_}\n";}
   		
   		
   		}
   		
   		
  }
  
 }

