#!/perl-w
open(L,"group_p.txt");
while(<L>){
	chomp;
	#Aromatic	LOC_Os06g11400.1	166.666666666667	672
  # 0         1                    2             3
  @l=split;
  $syn{$l[0]."\t".$l[1]}=$l[2];
  #$non_syn{$l[0]."\t".$l[1]}=$l[3]-$l[2]-3;
  $non_syn{$l[0]."\t".$l[1]}=$l[3]-$l[2];
	}

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
if($file =~ /(.*).group/){$output=$1.".nei1987.pi.txt"}
if($file =~ /(.*).new/){$g_name=$1}
open(W,">$output");

while(<R>){if(/contigs/){next;}
	
	chomp;
	@a=split/\t/,$_;


	$info{$a[0]."\t".$a[1]}=$_;
		}
close(R);
$sample=@a-3;


######split loc
foreach(sort keys %scaffold){$count=0;
    	%ID={};%he={};%hash={};$count_ha=0;%seq={};
	%start={};%c={};
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
	$lengt{$in}=$gff[1];
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
   		
  
   $n++;	}
   if($_<=$en{$n} and $_>=$start{$n}){
 
 		if($info{$scaff."\t".$_}){
 			 @b=split/\t/,$info{$scaff."\t".$_};
 		  
 			for($k=3;$k<@b;$k++){
 				${"C".$n}{$k}=${"C".$n}{$k}.$b[$k];
 				$c{"C".$n}=1;
        
 				}
 			
 				
 			
 	
 		
 	
 		}
 		
 	
 	
 		
   		
   		
   		}
   		
   		
  }
  
  ####calcutlate the seq's kind#####################################
  foreach(sort keys %c){
  	if(!($c{$_})){next;}
  	$list=$_;
  	if($list=~/C(\d+)/){$num=$1;}
  	     foreach(sort  keys %{$list}){
  	     	if(!(${$list}{$_})){next;}
   		 
   		 	
   		 	$he{${$list}{$_}}++;
   		 	   		 	
   		 	   		 }
   		 	   		 		
   		 ########################
   		    foreach(sort keys %he){
   		    	if(!($he{$_})){next;}
   		    	 $seq1=$_;
   		    	  foreach(sort keys %he){
   		    	  	if(!($he{$_})){next;}
   		    	  	$seq2=$_;
   		    	  	
   		    	  	@s1=split//,$seq1;
   		    	  	@s2=split//,$seq2;
   		    	  	
   		    	  	
   		    	  	################
   		    	  
   		    	  $pi=$he{$seq1}/(@b-3);
   		    	  $qi=$he{$seq2}/(@b-3);	
   		    	  	#################
   		    	  	$z=0;$ij=0;
   		    	   while($z<@s1){
   		    	   	if($s1[$z] ne $s2[$z]){
   		    	   		$ij++;
   		    	   		}
   		    	   	$z++;
   		    	   	}
   		    	   	#######length##########
   		    	   	$len=$lengt{$num};
   		    	   	if($file=~/\.sny/){
   		    	   		$len=$syn{$g_name."\t".$gene_name{$num}};
   		    	   		}
   		    	   	if($file=~/\.nonsny/){
   		    	   		$len=$non_syn{$g_name."\t".$gene_name{$num}};
   		    	   		}
   		    	   	if($file=~/\.silent/){
   		    	   		#$len=($en{$num}-$start{$num}+1)-$non_syn{$g_name."\t".$gene_name{$num}}-3;
   		    	   		$len=$lengt{$num}-$non_syn{$g_name."\t".$gene_name{$num}};
   		    	   		}
   		    	   	$pij=$ij/$len;
   		    	 
   		    	  	#################
   		    	  	$piqipij=$pi * $qi *$pij;
   		    	  	
   		    	  		$final=$piqipij + $final;
   		    	  	}
   		    
   		    	
   		    	}
   		  	   		 
   		 	   		 	
   		 	   		 	
   		 	   		 	
   		 	   		 	
   		 ##############################
   		 %he={};%hash={};%seq={};
   		 #########################################
   		 $final=$final*((@b-3)/(@b-3-1));
   		###############################
 	 	   	print W  "$scaff\t$final\t$ID_name{$num}\t$gene_name{$num}\t$start{$num}\t$en{$num}\n";
   		    	  %he={};	$final=0;$pi=0;$qj=0;$pij=0;$count_he=0;%{$list}={};
                     }

}}