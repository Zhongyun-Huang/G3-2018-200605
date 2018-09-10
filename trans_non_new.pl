
#!/perl-w

####AA
%AA = (
	'AAA' => 'K',	'AAC' => 'N',	'AAG' => 'K',	'AAT' => 'N',
	'AAR' => 'K',	'AAY' => 'N',	'ACA' => 'T',	'ACC' => 'T',
	'ACG' => 'T',	'ACT' => 'T',	'ACR' => 'T',	'ACY' => 'T',
	'ACK' => 'T',	'ACM' => 'T',	'ACW' => 'T',	'ACS' => 'T',
	'ACB' => 'T',	'ACD' => 'T',	'ACH' => 'T',	'ACV' => 'T',
	'ACN' => 'T',	'AGA' => 'R',	'AGC' => 'S',	'AGG' => 'R',
	'AGT' => 'S',	'AGR' => 'R',	'AGY' => 'S',	'ATA' => 'I',
	'ATC' => 'I',	'ATG' => 'M',	'ATT' => 'I',	'ATY' => 'I',
	'ATM' => 'I',	'ATW' => 'I',	'ATH' => 'I',	'CAA' => 'Q',
	'CAC' => 'H',	'CAG' => 'Q',	'CAT' => 'H',	'CAR' => 'Q',
	'CAY' => 'H',	'CCA' => 'P',	'CCC' => 'P',	'CCG' => 'P',
	'CCT' => 'P',	'CCR' => 'P',	'CCY' => 'P',	'CCK' => 'P',
	'CCM' => 'P',	'CCW' => 'P',	'CCS' => 'P',	'CCB' => 'P',
	'CCD' => 'P',	'CCH' => 'P',	'CCV' => 'P',	'CCN' => 'P',
	'CGA' => 'R',	'CGC' => 'R',	'CGG' => 'R',	'CGT' => 'R',
	'CGR' => 'R',	'CGY' => 'R',	'CGK' => 'R',	'CGM' => 'R',
	'CGW' => 'R',	'CGS' => 'R',	'CGB' => 'R',	'CGD' => 'R',
	'CGH' => 'R',	'CGV' => 'R',	'CGN' => 'R',	'CTA' => 'L',
	'CTC' => 'L',	'CTG' => 'L',	'CTT' => 'L',	'CTR' => 'L',
	'CTY' => 'L',	'CTK' => 'L',	'CTM' => 'L',	'CTW' => 'L',
	'CTS' => 'L',	'CTB' => 'L',	'CTD' => 'L',	'CTH' => 'L',
	'CTV' => 'L',	'CTN' => 'L',	'GAA' => 'E',	'GAC' => 'D',
	'GAG' => 'E',	'GAT' => 'D',	'GAR' => 'E',	'GAY' => 'D',
	'GCA' => 'A',	'GCC' => 'A',	'GCG' => 'A',	'GCT' => 'A',
	'GCR' => 'A',	'GCY' => 'A',	'GCK' => 'A',	'GCM' => 'A',
	'GCW' => 'A',	'GCS' => 'A',	'GCB' => 'A',	'GCD' => 'A',
	'GCH' => 'A',	'GCV' => 'A',	'GCN' => 'A',	'GGA' => 'G',
	'GGC' => 'G',	'GGG' => 'G',	'GGT' => 'G',	'GGR' => 'G',
	'GGY' => 'G',	'GGK' => 'G',	'GGM' => 'G',	'GGW' => 'G',
	'GGS' => 'G',	'GGB' => 'G',	'GGD' => 'G',	'GGH' => 'G',
	'GGV' => 'G',	'GGN' => 'G',	'GTA' => 'V',	'GTC' => 'V',
	'GTG' => 'V',	'GTT' => 'V',	'GTR' => 'V',	'GTY' => 'V',
	'GTK' => 'V',	'GTM' => 'V',	'GTW' => 'V',	'GTS' => 'V',
	'GTB' => 'V',	'GTD' => 'V',	'GTH' => 'V',	'GTV' => 'V',
	'GTN' => 'V',	'TAA' => '*',	'TAC' => 'Y',	'TAG' => '*',
	'TAT' => 'Y',	'TAR' => '*',	'TAY' => 'Y',	'TCA' => 'S',
	'TCC' => 'S',	'TCG' => 'S',	'TCT' => 'S',	'TCR' => 'S',
	'TCY' => 'S',	'TCK' => 'S',	'TCM' => 'S',	'TCW' => 'S',
	'TCS' => 'S',	'TCB' => 'S',	'TCD' => 'S',	'TCH' => 'S',
	'TCV' => 'S',	'TCN' => 'S',	'TGA' => '*',	'TGC' => 'C',
	'TGG' => 'W',	'TGT' => 'C',	'TGY' => 'C',	'TTA' => 'L',
	'TTC' => 'F',	'TTG' => 'L',	'TTT' => 'F',	'TTR' => 'L',
	'TTY' => 'F',	'TRA' => '*',	'YTA' => 'L',	'YTG' => 'L',
	'YTR' => 'L',	'MGA' => 'R',	'MGG' => 'R',	'MGR' => 'R'
);
%SM = ('R'=>'A,G','Y'=>'C,T','M'=>'A,C','K'=>'T,G','S'=>'C,G','W'=>'A,T');

@file=glob("*.new.group");
foreach(@file){$file=$_;

if(/(.*).group/){$output1=$1.".nonsny.group";
		               $output2=$1.".sny.group";
		             $output3=$1.".silent.group";}
		             open(W1,">$output1");
open(W2,">$output2");
open(W3,">$output3");
open(R2,"$_");
while(<R2>){
 if(/contig/){print W1 "$_";
 	            print W2 "$_";
 	            print W3 "$_";}}
close(R2);
open(R,"msu6.fa");
%seq=<R>;
foreach(sort keys %seq){
if(/>(.*)\s/){	$scaff=$1;}

		%ID={};%have={};
	%start={};
	%en={};
	%loc={};
	%p={};
	%dir={};
	%ID_name={};
	$in=1;

open(R1,"cds_sort.gff");
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
   	
   	
   			@b=split/\t/,$loc{$_};
         %aa_count={};%c_h={};
 				for($t=2;$t<@b;$t++){
 					#$b[$t]
 			if($dir{$n} eq "+"){
#scaffold_1	Aquca_001_00004	33761	33839	-	2 
       $first=$start{$n}-$p{$n};
       $l=($base_loc-$first)%3;
         if($l==2){ $s1=substr($seq{">".$scaff."\n"},$base_loc-1-2,1); 
       	            $s2=substr($seq{">".$scaff."\n"},$base_loc-1-1,1); 
       	            $s3=substr($seq{">".$scaff."\n"},$base_loc-1-0,1);  
       	           if($b[$t] eq "N"){
       	              
       	                $aa=$AA{$s1.$s2.$s3};
       	              	#$aa="na"
       	              	}
       	           elsif(!$AA{$s1.$s2.$b[$t]}){@u=split/,/,$SM{$b[$t]};
       	           	$aa=$AA{$s1.$s2.$u[0]}.",".$AA{$s1.$s2.$u[1]};}
       	           else{$aa=$AA{$s1.$s2.$b[$t]}}	
       	         
       	         }
       	           				
 			 elsif($l==1){ $s1=substr($seq{">".$scaff."\n"},$base_loc-1-1,1); 
       	            $s2=substr($seq{">".$scaff."\n"},$base_loc-1-0,1);
       	            $s3=substr($seq{">".$scaff."\n"},$base_loc-1+1,1);
       	             if($b[$t] eq "N"){
       	              
       	                $aa=$AA{$s1.$s2.$s3};
       	              	#$aa="na"
       	              	}
       	           elsif(!$AA{$s1.$b[$t].$s3}){@u=split/,/,$SM{$b[$t]};
       	           	$aa=$AA{$s1.$u[0].$s3}.",".$AA{$s1.$u[1].$s3};}
       	           else{$aa=$AA{$s1.$b[$t].$s3}}
       	           ################
       	         if($loc{$base_loc+1} ){
       	         		
       	         		 		$have{$base_loc+1}=1;
       	         		 		$c_h{$base_loc+1}=1;
       	         		 		@a1=split/\t/,$loc{$base_loc+1};
       	         		 		$aa=$AA{$s1.$b[$t].$a1[$t]}
       	         		 		
       	         		
       	         	}
       	         
       	         ###############
       	           
       	          }
 			 elsif($l==0){ $s1=substr($seq{">".$scaff."\n"},$base_loc-1-0,1);
 			 	              $s2=substr($seq{">".$scaff."\n"},$base_loc-1+1,1); 
       	              $s3=substr($seq{">".$scaff."\n"},$base_loc-1+2,1);
       	               if($b[$t] eq "N"){
       	              
       	                $aa=$AA{$s1.$s2.$s3};
       	              	#$aa="na"
       	              	}
       	           elsif(!$AA{$b[$t].$s2.$s3}){@u=split/,/,$SM{$b[$t]};
       	           	$aa=$AA{$u[0].$s2.$s3}.",".$AA{$u[1].$s2.$s3};}
       	           else{$aa=$AA{$b[$t].$s2.$s3}}
       	           
       	           ################
       	         if($loc{$base_loc+2} or $loc{$base_loc+1}){
       	         		 if($loc{$base_loc+2} and $loc{$base_loc+1}){
       	         		 	$have{$base_loc+2}=1;$have{$base_loc+1}=1;
       	         		 	$c_h{$base_loc+2}=1;$c_h{$base_loc+1}=1;
       	         		 	@a1=split/\t/,$loc{$base_loc+1};
       	         		 	@a2=split/\t/,$loc{$base_loc+2};
       	         		 	$aa=$AA{$b[$t].$a1[$t].$a2[$t]}
       	         		 	}
       	         		 	elsif($loc{$base_loc+2}){
       	         		 		$have{$base_loc+2}=1;
       	         		 		$c_h{$base_loc+2}=1;
       	         		 		@a2=split/\t/,$loc{$base_loc+2};
       	         		 		$aa=$AA{$b[$t].$s2.$a2[$t]}
       	         		 		}
       	         		 	elsif($loc{$base_loc+1}){
       	         		 		$have{$base_loc+1}=1;
       	         		 		$c_h{$base_loc+1}=1;
       	         		 		@a1=split/\t/,$loc{$base_loc+1};
       	         		 		$aa=$AA{$b[$t].$a1[$t].$s3}
       	         		 		}
       	         		
       	         	}
       	         
       	         ###############
       	          }
 				       }
 			 if($dir{$n} eq "-"){
#scaffold_1	Aquca_001_00004	33761	33839	-	2 
       $first=$en{$n}+$p{$n};
       $l=($first-$base_loc)%3;
         if($l==2){  $s1=substr($seq{">".$scaff."\n"},$base_loc-1-0,1);
 			 	              $s2=substr($seq{">".$scaff."\n"},$base_loc-1+1,1); 
       	              $s3=substr($seq{">".$scaff."\n"},$base_loc-1+2,1);
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
       	              			
 			 elsif($l==1){ $s1=substr($seq{">".$scaff."\n"},$base_loc-1-1,1); 
       	            $s2=substr($seq{">".$scaff."\n"},$base_loc-1-0,1);
       	            $s3=substr($seq{">".$scaff."\n"},$base_loc-1+1,1);
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
       	             
 			 elsif($l==0){ $s1=substr($seq{">".$scaff."\n"},$base_loc-1-2,1); 
       	            $s2=substr($seq{">".$scaff."\n"},$base_loc-1-1,1); 
       	            $s3=substr($seq{">".$scaff."\n"},$base_loc-1-0,1);
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
 				       	$aa_count{$aa}=1;
 				       
                      }  
                      $count=keys %aa_count;
                      
                        if($count>2){
                        	print W1 "$loc{$base_loc}\n";
                        	
                        		
                        		foreach(sort {$a<=>$b} keys %c_h){
                        			if($loc{$_}){
                        			print W1 "$loc{$_}\n";
                        		}}
                        		
                        	}
                        elsif($count==2){
                        
                        	print W2 "$loc{$base_loc}\n";
                        	print W3 "$loc{$base_loc}\n";
                        	foreach(sort {$a<=>$b} keys %c_h){
                        			if($loc{$_}){
                        			print W2 "$loc{$_}\n";
                        			print W3 "$loc{$_}\n";
                        		}}
                        	}	
                        	 }

        
   			
   			else{print W3 "$loc{$_}\n";}
   				}
   		
 }}