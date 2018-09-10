
#!/perl-w

####AA
$s{"F"}= 1/3;
$s{"L1"}= 2/3; 
$s{"L2"}= 3/3; 
$s{"L3"}= 4/3; 
$s{"I"}= 2/3;
$s{"M"}= 0;
$s{"V"}= 1;
$s{"S2"}= 1/3 ;
$s{"S4"}= 1;
$s{"P"}= 1;
$s{"T"}= 1;
$s{"A"}= 1;
$s{"Y"}=3/3;
$s{"H"}= 1/3;
$s{"Q"}= 1/3;
$s{"N"}= 1/3;
$s{"K"}= 1/3;
$s{"D"}= 1/3;
$s{"E"}= 1/3;
$s{"C"}= 1/2;
$s{"W"}= 0;
$s{"R1"}= 3/3;
$s{"R3"}= 3/2;
$s{"R4"}= 4/3;
$s{"R5"}= 5/6;
$s{"R6"}= 2/3;
$s{"G"}= 1;

####AA
%AA = (
	'AAA' => 'K',	'AAC' => 'N',	'AAG' => 'K',	'AAT' => 'N',
	'ACA' => 'T',	'ACC' => 'T',	'ACG' => 'T',	'ACT' => 'T',	
	'AGA' => 'R5',	'AGC' => 'S2',	'AGG' => 'R6',	'AGT' => 'S2',	
	'ATA' => 'I',	'ATC' => 'I',	'ATG' => 'M',	'ATT' => 'I',	
	'CAA' => 'Q',	'CAC' => 'H',	'CAG' => 'Q',	'CAT' => 'H',	
	'CCA' => 'P',	'CCC' => 'P',	'CCG' => 'P',	'CCT' => 'P',	
	'CGA' => 'R3',	'CGC' => 'R1',	'CGG' => 'R4',	'CGT' => 'R1',
	'CTA' => 'L3',	'CTC' => 'L2',	'CTG' => 'L3',	'CTT' => 'L2',	
	'GAA' => 'E',	'GAC' => 'D',	'GAG' => 'E',	'GAT' => 'D',	
	'GCA' => 'A',	'GCC' => 'A',	'GCG' => 'A',	'GCT' => 'A',
	'GGA' => 'G',	'GGC' => 'G',	'GGG' => 'G',	'GGT' => 'G',	
	'GTA' => 'V',	'GTC' => 'V',	'GTG' => 'V',	'GTT' => 'V',	
	'TAA' => '*',	'TAC' => 'Y',	'TAG' => '*',	'TAT' => 'Y',	
	'TCA' => 'S4',	'TCC' => 'S4',	'TCG' => 'S4',	'TCT' => 'S4',	
	'TGA' => '*',	'TGC' => 'C',	'TGG' => 'W',	'TGT' => 'C',	
	'TTA' => 'L1',	'TTC' => 'F',	'TTG' => 'L1',	'TTT' => 'F'
);



 
open(R,"msu6.fa")||die $!;

while(<R>){
	if(/>(\w+)\s/){$k=$1;}
	else{
		$seq{$k}=$_; 
		}
	}
close(R);

foreach(sort keys %seq){
 	$scaff=$_;

		%ID={};%have={};
	%start={};
	%en={};
	%loc={};
	%p={};
	%dir={};
	%ID_name={};
	$in=1;

open(R1,"cds_sort.gff")||die $!;
#1	MSU_osa1r6	CDS	2449	2616	.	+	0	Parent=13101.m00001	LOC_Os01g01010.1
#1	MSU_osa1r6	CDS	3357	3455	.	+	0	Parent=13101.m00001	LOC_Os01g01010.1
# 0         1     2     3     4   5 6 7    8                        9   


while(<R1>){
	chomp;
		@gff=split;
		if($gff[2] ne "CDS"){next;}
	if($gff[0] ne $scaff){next;}
	$ID_name{$in}=$gff[-1];
	$trans{$in}=$gff[-1];
	$ID{$in}=$gff[0];
	$start{$in}=$gff[3];
	$en{$in}=$gff[4];
	$p{$in}=$gff[7];
	$dir{$in}=$gff[6];
	
	
	$in++	
		
	}
	close(R1);

open(R2,"cds_over_fragment.txt")||die $!;
while(<R2>){
   if(/contig/){next;}
  #1	10055515	G	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	T_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G,T_heter	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	T_homo	G_homo	G_homo	G_homo	G_homo	G_homo	T_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo

	chomp;
	@snp=split;
	if($snp[0] ne $scaff){
		next;}
	
	$loc{$snp[1]}=$snp[2];
	$gene{$snp[1]}=$snp[3];
	$cds{$snp[3]}=$snp[4];
	 
   }
   close(R2);
   $m=$in-1;
   $n=1;
 
   foreach(sort {$a<=>$b} keys %loc){
   	
   	if($_>$en{$m}){last;}
   	if($_<$start{$n}){next;}
   	while($_>$en{$n}){   $n++;	}
   if($_<=$en{$n} and $_>=$start{$n}){
   	#insert
   	###################
   	
   	
   	####################
   	
   			
 				for($t=$_;$t<=$loc{$_};$t++){
 					$base_loc=$t;
   	if($have{$base_loc}){next;}
 					#$b[$t]
 				
 			if($dir{$n} eq "+"){
#scaffold_1	Aquca_001_00004	33761	33839	-	2 
       $first=$start{$n}-$p{$n};
       $l=($base_loc-$first)%3;
         if($l==2){ $s1=substr($seq{$scaff},$base_loc-1-2,1); 
       	            $s2=substr($seq{$scaff},$base_loc-1-1,1); 
       	            $s3=substr($seq{$scaff},$base_loc-1-0,1);  
       	            }
       	           				
 			 elsif($l==1){ $s1=substr($seq{$scaff},$base_loc-1-1,1); 
       	            $s2=substr($seq{$scaff},$base_loc-1-0,1);
       	            $s3=substr($seq{$scaff},$base_loc-1+1,1);
       	          	$have{$base_loc+1}=1;
       	         	
       	         	}
       	       
 			 elsif($l==0){ $s1=substr($seq{$scaff},$base_loc-1-0,1);
 			 	              $s2=substr($seq{$scaff},$base_loc-1+1,1); 
       	              $s3=substr($seq{$scaff},$base_loc-1+2,1);
       	               
       	       
       	         		 	$have{$base_loc+2}=1;$have{$base_loc+1}=1;
       	         	
       	         	}
       	         
       	         	$code=$s1.$s2.$s3;
       	         		$aa=$AA{$code};  
       	         ###############
       	          }
 				       
 			 if($dir{$n} eq "-"){
#scaffold_1	Aquca_001_00004	33761	33839	-	2 
       $first=$en{$n}+$p{$n};
       $l=($first-$base_loc)%3;
         if($l==2){  $s1=substr($seq{$scaff},$base_loc-1-0,1);
 			 	              $s2=substr($seq{$scaff},$base_loc-1+1,1); 
       	              $s3=substr($seq{$scaff},$base_loc-1+2,1);
       	               $r=reverse($s1.$s2.$s3);
       	               $r=~tr/ATGC/TACG/;
       	              
       	             
       	         		 	$have{$base_loc+2}=1;$have{$base_loc+1}=1;
       	         		 	
       	         	
       	              
       	              
       	              
       	              }
       	              			
 			 elsif($l==1){ $s1=substr($seq{$scaff},$base_loc-1-1,1); 
       	            $s2=substr($seq{$scaff},$base_loc-1-0,1);
       	            $s3=substr($seq{$scaff},$base_loc-1+1,1);
       	               $r=reverse($s1.$s2.$s3);
       	               $r=~tr/ATGC/TACG/;
       	               
       	         		 		$have{$base_loc+1}=1;
       	         		 		  
       	              ############################
       	              }
       	             
 			 elsif($l==0){ $s1=substr($seq{$scaff},$base_loc-1-2,1); 
       	            $s2=substr($seq{$scaff},$base_loc-1-1,1); 
       	            $s3=substr($seq{$scaff},$base_loc-1-0,1);
       	               $r=reverse($s1.$s2.$s3);
       	               $r=~tr/ATGC/TACG/;
       	               } 
       	               
       	               
       	               $aa=$AA{$r};  
       	               
       	               }
       	               
       	               
       	       
 				           $syn{$gene{$_}}+=$s{$aa};
                      
                      
                      }  
                         }

        
   			
   			
   				}
   		
  }
 
 
 foreach(sort keys %syn){
 	$non=$cds{$_}-$syn{$_};
 	print "$_\t$syn{$_}\t$non\t$cds{$_}\n";
 	
 	
 	
 	
 	}