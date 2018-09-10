#!/perl-w


open(R,"header.txt");
while(<R>){
	chomp;
	if(/SN:(\w+)\s+LN:(\d+)/){
		$ln{$1}=$2;
		$scaffold{$1}=1;}}
			close(R);
######
@file=glob("*.group");
	
	foreach(@file){
		$file=$_;
open(R,"$file");
if($file =~ /(.*).group/){$output=$1."_watterson3.count"}
open(W,">$output");

while(<R>){if(/contigs/){next;}
	
	chomp;
	@a=split;


	$info{$a[0]."\t".$a[1]}=$_;
		}
close(R);
$sample=@a-3;$an=0;
for($t=1;$t<$sample;$t++){
$an=$an+1/$t;}


######split loc
foreach(sort keys %scaffold){$count=0;
    	%ID={};%he={};%hash={};$count_ha=0;%seq={};
	%start={};%watterson={};
	%en={};	$z=0;$ij=0;
	%s={};$final=0;$pi=0;$qj=0;$pij=0;
	$in=1;$scaff=$_;
	open(R1,"new_cover_region.txt");
	while(<R1>){
		chomp;
		
	
		@gff=split;
	if($gff[0] ne $scaff){next;}
	$ID_name{$in}=$gff[1];
	$gene_name{$in}=$gff[-1];
	$ID{$in}=$gff[0];
	$start{$in}=$gff[2];
	$en{$in}=$gff[3];
	$lengt{$in}=$gff[3]-$gff[2]+1;
	$in++	
		
	}
	close(R1);
open(R2,"$file");
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
   	if(!($s{$_})){next;}
                                             
   	if($_>$en{$m}){last;}
   	
   	if($_<$start{$n}){next;}
   	
   	while($_>$en{$n}){
   		$count=0;
   		
   $n++;	}
   if($_<=$en{$n} and $_>=$start{$n}){
 ########################################################
 		if($info{$scaff."\t".$_}){ 
 			$info=$info{$scaff."\t".$_};
 			if($info=~/(.*\w)/){$info=$1}
 			
 			
 			 @b=split/\t/,$info;
 		 
 			###################
 			
 			for($o=3;$o<@b;$o++){ 
 				
 				#if($b[$o]=~/(\w+)/){$b[$o]=$1}			
          	                 
 				if($b[$o] ne "NA"){
 					
 			  	$com=$b[$o];	last;}
		}	
 		  for($o=3;$o<@b;$o++){
 				# 	if($b[$o]=~/(\w+)/){$b[$o]=$1}
 				if($b[$o] ne $com and $b[$o] ne "NA"){
 			  	$count++;last;}
			      }
 			###################
 			
 				
 			
 	    
 		
 	$watterson{$n}=$count;
 		
 	######################################################
 	
 		
   		
   		
   		}
   		
   		
  }
  
       
 }
 foreach(sort {$a <=> $b} keys %watterson){
       	if($gene_name{$_}){
      print  W "$scaff\t$watterson{$_}\t$ID_name{$_}\t$gene_name{$_}\t$start{$_}\t$en{$_}\n"; 	
      }
      }
}}