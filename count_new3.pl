#!/perl-w

#####################
@file=glob("*.group");
foreach(@file){
	if(/(.*).group/){$output=$1.".new.group"}
open(R,"$_");
open(W,">$output");
while(<R>){	$info="";
	if(/contig/){print W "$_";next;}
chomp;
$A=0;
$T=0;
$G=0;
$C=0;
$b1_na=0;
$b2_na=0;
$NA=0;
@a=split;
foreach(@a){
if($_ eq "A_homo"){$A++;}
if($_ eq "T_homo"){$T++;}
if($_ eq "G_homo"){$G++;}
if($_ eq "C_homo"){$C++;}

if($_ =~/(\w),(\w)_heter/){
	  $a=$1;   $b=$2;
	 if($a=~"A" ){$A+=0.5}
	 if($b=~"A"  ){$A+=0.5}
	 if($a=~"T"  ){$T+=0.5}
	 if($b=~"T"  ){$T+=0.5}
	 if($a=~"C"  ){$C+=0.5}
	 if($b=~"C"  ){$C+=0.5}
	 if($a=~"G"  ){$G+=0.5} 
	 if($b=~"G"  ){$G+=0.5} 
	 
	    }
    }
############################################

$hash{"A"}=$A;$hash{"T"}=$T;$hash{"G"}=$G;$hash{"C"}=$C;
$i=0;
foreach(sort {$hash{$a}<=>$hash{$b}} keys %hash){
	$m[$i]=$_;
	$i++;
	
	}

######################################
  	  #print W "$a[0]\t$a[1]\t$a[2]";

	if($hash{$m[3]}==0){
		    s/_homo//g;
		    s/NA/N/g;
			print W "$_\n";next;
		
		}
######################################
	elsif($hash{$m[2]}==0 ){
		     
			$base=("\t".$m[3]) x (@a-3);
			print W "$a[0]\t$a[1]\t$a[2]$base\n";next;
			}
#######################################
  elsif($hash{$m[1]}==0 ){
  	
  	  
  	  ################################################
  	  $info="$a[0]\t$a[1]\t$a[2]";
  	
  	  foreach(@a){
  	  	if(/_homo/){s/_homo//;$info=$info."\t$_";}
  	  	elsif(/(.*)_heter/){s/(.*)_heter/NA/;$info=$info."\t$_";}
  	  	elsif(/NA/){$info=$info."\t$_";}
  	  	
  	  	}
  	  }	
  	  ################################################
		

#################################### 	  
  #********************************
  elsif($hash{$m[0]}==0 ){
  	   
  	  $info="$a[0]\t$a[1]\t$a[2]";
  	  ###############################
  	  foreach(@a){
  	  	if(/$m[2]_homo/ or /$m[3]_homo/){s/_homo//;$info=$info."\t$_";
  	   		
  	   		  }
  	  	elsif(/$m[1]_homo/){s/$m[1]_homo/NA/;
  	  		$info=$info."\t$_";
  	   		
  	   		  }
  	    elsif(/$m[1],(\w)_heter/ or /(\w),$m[1]_heter/){
  	  		$info=$info."\t$1";
  	   		}
  	  	
  	    elsif(/$m[2],$m[3]_heter/ or /$m[3],$m[2]_heter/){
  	    	s/(.*)_heter/NA/;$info=$info."\t$_";
  	    	
  	    	
  	    }
  	  
  	  elsif(/NA/){$info=$info."\t$_";}
  	  	
  	  	
  	  	}
  	
  	      }
  	
  ######################################################	
  else{$info="$a[0]\t$a[1]\t$a[2]";
  	
       foreach(@a){
       	if(/$m[2]_homo/ or /$m[3]_homo/){s/_homo//;$info=$info."\t$_";
  	   		
  	   		  }
       	elsif(/$m[0],$m[1]_heter/ or /$m[1],$m[0]_heter/){
       		s/$m[0],$m[1]_heter/NA/;
       		s/$m[1],$m[0]_heter/NA/;
       		$info=$info."\t$_";
       		}
  	   	elsif(/$m[1],(\w)_heter/ or /(\w),$m[1]_heter/ or /$m[0],(\w)_heter/ or /(\w),$m[0]_heter/){
  	   		$info=$info."\t$1";
  	   	 
  	   		}
  	   	elsif(/$m[1]_homo/ or /$m[0]_homo/){s/(\w+)_homo/NA/;$info=$info."\t$_";
  	   		
  	   		  }
  	    elsif(/$m[2],$m[3]_heter/ or /$m[3],$m[2]_heter/){
  	    	s/(.*)_heter/NA/;$info=$info."\t$_";
  	    	
  	    	}
  	    	elsif(/NA/){$info=$info."\t$_";}
  	    
  	   	}
     
  	  
  	
     }
     
     @d=split/\t/,$info;
     
     foreach(@d){
     	 if(/NA/){$NA++;}
     	
     	}
     	 if($NA>1){$b1_na=int($NA*($hash{$m[3]}/($hash{$m[2]}+$hash{$m[3]})));
  	    $b2_na=$NA-$b1_na;}
  	   if($NA==1){$b2_na=int($NA*($hash{$m[3]}/($hash{$m[2]}+$hash{$m[3]})));
  	    $b1_na=$NA-$b2_na;
  	    	
  	    	}
  	    	
  	  print  W "$a[0]\t$a[1]\t$a[2]";
     	for($z=3;$z<=@d;$z++){
     		if($d[$z]=~/NA/){
     			
  	  		if($b1_na>0){
  	  			$d[$z]=~s/NA/$m[3]/;
  	  			$b1_na--;
  	  			print W "\t$d[$z]";
  	  			}
  	  		elsif($b2_na>0){
  	  			$d[$z]=~s/NA/$m[2]/;
  	  			$b2_na--;
  	  			print W "\t$d[$z]";
  	  			
  	  			}
     			
     			
     			}
     		else{print W "\t$d[$z]";}
     		}
     		print W "\n";
	


###########################################
}}
#################################