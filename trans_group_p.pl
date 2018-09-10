
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


open(P,"cds_syn.txt");
while(<P>){
	chomp;
	@a=split;
	$len{$a[0]}=$a[3];
		$syn{$a[0]}=$a[1];
	}
	close(P);
open(R,"msu6.fa");

while(<R>){
	if(/>(\w+)\s/){$k=$1;}
	else{
		$seq{$k}=$_; 
		}
	}
close(R);

@file=glob("*.new.group");
foreach(@file){$file=$_;
if($file=~/(.*).new.group/){$group=$1;}




		
	@file2=glob("gene_region*.txt");
foreach(@file2){%c=();%ID=();%have=();%trans=();
	%start=();
	%en=();
	%loc=();
	%p=();
	%dir=();
	%ID_name=();
	$in=1;
	$file2=$_;
open(R1,"$file2");
#1	MSU_osa1r6	CDS	2449	2616	.	+	0	Parent=13101.m00001	LOC_Os01g01010.1
#1	MSU_osa1r6	CDS	3357	3455	.	+	0	Parent=13101.m00001	LOC_Os01g01010.1
# 0         1     2     3     4   5 6 7    8                        9   


while(<R1>){
	chomp;
		@gff=split;
		if($gff[2] ne "CDS"){next;}
	$scaff=$gff[0];
	$ID_name{$in}=$gff[-1];
	$trans{$in}=$gff[-1];
	$ID{$in}=$gff[0];
	$start{$in}=$gff[3];
	$en{$in}=$gff[4];
	$p{$in}=$gff[7];
	$dir{$in}=$gff[6];
		$trans=$gff[-1];
	
	$in++	
		
	}
	close(R1);

open(R2,"$file");
while(<R2>){
   if(/contig/){next;}
  #1	10055515	G	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	T_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G,T_heter	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	T_homo	G_homo	G_homo	G_homo	G_homo	G_homo	T_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo	G_homo

	chomp;
	@snp=split;
	if($snp[0] ne $scaff){
		next;}
	
	$loc{$snp[1]}=$_;

   }
   close(R2);
   $m=$in-1;
   $n=1;
  
   foreach(sort {$a<=>$b} keys %loc){
   	$base_loc=$_;
   	if(!($loc{$_})){next;}
   	if($have{$base_loc}){next;}
   	
   	while($_>$en{$n}){ if(!($en{$n})){last;}  $n++;	}
   if($_<=$en{$n} and $_>=$start{$n}){
   	#insert
   	  if($loc{$_}=~/(\w.*\w)/){$loc_infor=$1}
   	
   			@b=split/\t/,$loc_infor;
         %aa_count={};%c_h={};
 				for($t=3;$t<@b;$t++){
 					
 			if($dir{$n} eq "+"){
#scaffold_1	Aquca_001_00004	33761	33839	-	2 
       $first=$start{$n}-$p{$n};
       $l=($base_loc-$first)%3;
         if($l==2){ $s1=substr($seq{$scaff},$base_loc-1-2,1); 
       	            $s2=substr($seq{$scaff},$base_loc-1-1,1); 
       	            $s3=substr($seq{$scaff},$base_loc-1-0,1);
       	            $refer=  $s1.$s2.$s3;
       	           if($b[$t] eq "N"){
       	              
       	                $aa=$AA{$s1.$s2.$s3};
       	                $r=$s1.$s2.$s3;
       	              	#$aa="na"
       	              	}
       	         
       	           else{$aa=$AA{$s1.$s2.$b[$t]};
       	           	      $r=$s1.$s2.$b[$t];      }	
       	         
       	         }
       	           				
 			 elsif($l==1){ $s1=substr($seq{$scaff},$base_loc-1-1,1); 
       	            $s2=substr($seq{$scaff},$base_loc-1-0,1);
       	            $s3=substr($seq{$scaff},$base_loc-1+1,1);
       	            $refer=$s1.$s2.$s3;
       	             if($b[$t] eq "N"){
       	              
       	                $aa=$AA{$s1.$s2.$s3};
       	              	$r=$s1.$s2.$s3;
       	              	}
       	       
       	           else{$aa=$AA{$s1.$b[$t].$s3};
       	           	 $r=$s1.$s2.$s3;}
       	           ################
       	         if($loc{$base_loc+1} ){
       	         		
       	         		 		$have{$base_loc+1}=1;
       	         		 		$c_h{$base_loc+1}=1;
       	         		 		@a1=split/\t/,$loc{$base_loc+1};
       	         		 		$aa=$AA{$s1.$b[$t].$a1[$t]};
       	         		 		$r=$s1.$b[$t].$a1[$t];
       	         	
       	         	}
       	         
       	         ###############
       	           
       	          }
 			 elsif($l==0){ $s1=substr($seq{$scaff},$base_loc-1-0,1);
 			 	              $s2=substr($seq{$scaff},$base_loc-1+1,1); 
       	              $s3=substr($seq{$scaff},$base_loc-1+2,1);
       	               		
       	         		$refer=$s1.$s2.$s3;       	         		

       	               if($b[$t] eq "N"){
       	              
       	                $aa=$AA{$s1.$s2.$s3};
       	              	$r=$s1.$s2.$s3;
       	              	}
       	          
       	           else{$aa=$AA{$b[$t].$s2.$s3};
       	           	     $r=$b[$t].$s2.$s3;
       	           	     }
       	           
       	           ################
       	         if($loc{$base_loc+2} or $loc{$base_loc+1}){
       	         		 if($loc{$base_loc+2} and $loc{$base_loc+1}){
       	         		 	$have{$base_loc+2}=1;$have{$base_loc+1}=1;
       	         		 	$c_h{$base_loc+2}=1;$c_h{$base_loc+1}=1;
       	         		 	@a1=split/\t/,$loc{$base_loc+1};
       	         		 	@a2=split/\t/,$loc{$base_loc+2};
       	         		 	$aa=$AA{$b[$t].$a1[$t].$a2[$t]};
       	         		 	$r=$b[$t].$a1[$t].$a2[$t];
       	         		 	}
       	         		 	elsif($loc{$base_loc+2}){
       	         		 		$have{$base_loc+2}=1;
       	         		 		$c_h{$base_loc+2}=1;
       	         		 		@a2=split/\t/,$loc{$base_loc+2};
       	         		 		$aa=$AA{$b[$t].$s2.$a2[$t]};
       	         		 		$r=$b[$t].$s2.$a2[$t];
       	         		 		
       	         		 		}
       	         		 	elsif($loc{$base_loc+1}){
       	         		 		$have{$base_loc+1}=1;
       	         		 		$c_h{$base_loc+1}=1;
       	         		 		@a1=split/\t/,$loc{$base_loc+1};
       	         		 		$aa=$AA{$b[$t].$a1[$t].$s3};
       	         		 		$r=$b[$t].$a1[$t].$s3;
       	         		 	
       	         		 		}
       	         		
       	         	}
       	         
       	         ###############
       	          }
 				       }
 			 if($dir{$n} eq "-"){
#scaffold_1	Aquca_001_00004	33761	33839	-	2 
       $first=$en{$n}+$p{$n};
       $l=($first-$base_loc)%3;
         if($l==2){  $s1=substr($seq{$scaff},$base_loc-1-0,1);
 			 	              $s2=substr($seq{$scaff},$base_loc-1+1,1); 
       	              $s3=substr($seq{$scaff},$base_loc-1+2,1);
       	               $refer=reverse($s1.$s2.$s3);
       	               $refer=~tr/ATGC/TACG/;
       	               
       	               $r=reverse($b[$t].$s2.$s3);
       	               $r=~tr/ATGC/TACG/;
       	              
       	               if($b[$t] eq "N"){
       	              	$r=reverse($s1.$s2.$s3);
       	               $r=~tr/ATGC/TACG/;
       	                $aa=$AA{$r};
       	              	#$aa="na"
       	              	}
       	           elsif(!($AA{$r})){@u=split/,/,$SM{$b[$t]};
       	              	    $r1=reverse($u[0].$s2.$s3);$r2=reverse($u[1].$s2.$s3); 
       	              	    $r1=~tr/ATGC/TACG/;$r2=~tr/ATGC/TACG/; 
       	              	    $aa=$AA{$r1}.",".$AA{$r2};    
       	              	 }
       	              else{$aa=$AA{$r}}
       	              
       	            ################
       	         if($loc{$base_loc+2} or $loc{$base_loc+1}){
       	         		 if($loc{$base_loc+2} and $loc{$base_loc+1}){
       	         		 	$have{$base_loc+2}=1;$have{$base_loc+1}=1;
       	         		 	$c_h{$base_loc+2}=1;$c_h{$base_loc+1}=1;
       	         		 	@a1=split/\t/,$loc{$base_loc+1};
       	         		 	@a2=split/\t/,$loc{$base_loc+2};
       	         		 	$r=reverse($b[$t].$a1[$t].$a2[$t]);
       	               $r=~tr/ATGC/TACG/;
       	               $aa=$AA{$r}
       	         		 	}
       	         		 	elsif($loc{$base_loc+2}){
       	         		 		$have{$base_loc+2}=1;
       	         		 		$c_h{$base_loc+2}=1;
       	         		 		@a2=split/\t/,$loc{$base_loc+2};
       	         		 		$r=reverse($b[$t].$s1.$a2[$t]);
       	               $r=~tr/ATGC/TACG/;
       	               $aa=$AA{$r}
       	         		 		}
       	         		 	elsif($loc{$base_loc+1}){
       	         		 		$have{$base_loc+1}=1;
       	         		 		$c_h{$base_loc+1}=1;
       	         		 		@a1=split/\t/,$loc{$base_loc+1};
       	         		 		$r=reverse($b[$t].$a1[$t].$s2);
       	               $r=~tr/ATGC/TACG/;
       	               $aa=$AA{$r}
       	         		 		}
       	         		
       	         	}
       	         
       	         ###############  
       	              
       	              
       	              
       	              
       	              }
       	              			
 			 elsif($l==1){ $s1=substr($seq{$scaff},$base_loc-1-1,1); 
       	            $s2=substr($seq{$scaff},$base_loc-1-0,1);
       	            $s3=substr($seq{$scaff},$base_loc-1+1,1);
       	            $refer=reverse($s1.$s2.$s3);
       	               $refer=~tr/ATGC/TACG/;
       	               $r=reverse($s1.$b[$t].$s3);
       	               $r=~tr/ATGC/TACG/;
       	                      	               
       	                 if($b[$t] eq "N"){
       	              	$r=reverse($s1.$s2.$s3);
       	               $r=~tr/ATGC/TACG/;
       	                $aa=$AA{$r};
       	              	#$aa="na"
       	              	}
       	           elsif(!($AA{$r})){@u=split/,/,$SM{$b[$t]};
       	              	    $r1=reverse($s1.$u[0].$s3);$r2=reverse($s1.$u[1].$s3); 
       	              	    $r1=~tr/ATGC/TACG/;$r2=~tr/ATGC/TACG/; 
       	              	    $aa=$AA{$r1}.",".$AA{$r2};    
       	              	 }
       	              else{$aa=$AA{$r}}
       	              #######################
       	             if($loc{$base_loc+1} ){
       	         		
       	         		 		$have{$base_loc+1}=1;
       	         		 		$c_h{$base_loc+1}=1;
       	         		 		@a1=split/\t/,$loc{$base_loc+1};
       	         		 		$r=reverse($s1.$b[$t].$a1[$t]);
       	               $r=~tr/ATGC/TACG/;
       	               $aa=$AA{$r}
       	         		 		
       	         		
       	         	} 
       	             
       	              ############################
       	              }
       	             
 			 elsif($l==0){ $s1=substr($seq{$scaff},$base_loc-1-2,1); 
       	            $s2=substr($seq{$scaff},$base_loc-1-1,1); 
       	            $s3=substr($seq{$scaff},$base_loc-1-0,1);
       	            $refer=reverse($s1.$s2.$s3);
       	               $refer=~tr/ATGC/TACG/;
       	               $r=reverse($s1.$s2.$b[$t]);
       	               $r=~tr/ATGC/TACG/;
       	               
       	              if($b[$t] eq "N"){
       	              	$r=reverse($s1.$s2.$s3);
       	               $r=~tr/ATGC/TACG/;
       	                $aa=$AA{$r};
       	              	#$aa="na"
       	              	}
       	           elsif(!($AA{$r})){@u=split/,/,$SM{$b[$t]};
       	              	    $r1=reverse($s1.$s2.$u[0]);$r2=reverse($s1.$s2.$u[1]); 
       	              	    $r1=~tr/ATGC/TACG/;$r2=~tr/ATGC/TACG/; 
       	              	    $aa=$AA{$r1}.",".$AA{$r2};    
       	              	 }
       	              else{$aa=$AA{$r}}} }
 				      if($r eq $refer){ 	
 				    # $c{$t}=$c{$t}-$s{$AA{$r}};
 				     #print "$c{$t}\t" 
 				     }
 				     	elsif($r ne $refer){ 
 				     	$c{$t}=$c{$t}-$s{$AA{$refer}} +	$s{$AA{$r}};	
 				     #print "$c{$t}\t$refer\t$r\n";
 				     # print "$c{$t}\t"
 				     }
 				      
                      }
                    $trans=$trans{$n};
                    
                     # print "\n";

                      }
           
        
   			
   			
   				}
   				
  $count=0; 
    foreach(sort keys %c){
    	$count=$count+$c{$_};
    	    	}
    	 $ave_count=$count/(@b-3);
    	  	$final=$syn{$trans}+$ave_count; 
    	  		
    print "$group\t$trans\t$final\t$len{$trans}\n";	
 }  
        
 
 
 
 
 }