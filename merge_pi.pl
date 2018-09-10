#!/perl-w
@filter=glob("*.txt");
	open(W,">merge.fra.pi");
	print W "contigs\ttype\tgene\tstart\tend\t";
foreach(@filter){
	if(/(.*).txt/){$name=$1;}
	print W "$name\t";
	open(R,"$_");
	#1	0.000643341385490532	other	LOC_Os01g20900.5
$n=0;
	while(<R>){
		 chomp;
			@b=split;
		
			$loc{$b[0]."\t".$b[2]."\t".$b[3]."\t".$b[4]."\t".$b[5]}=$b[1];
            ${$name}{$b[0]."\t".$b[2]."\t".$b[3]."\t".$b[4]."\t".$b[5]}=$b[1];
   
  
}}


	
	print W "\n";
	foreach(sort keys %loc){
		$sca=$_;
		$i=0;
		print W "$sca";@filter=glob("*.txt");
		foreach(@filter){
			if(/(.*).txt/){$name=$1;}
			
			$r=${$name}{$sca};
				if($r or $r eq "0"){print W "\t$r"; }
				else{print W "\tNA"; }
			$i++;
			
			}
		
	
		print W "\n"}