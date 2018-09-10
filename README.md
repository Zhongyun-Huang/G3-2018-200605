# G3-2018-200605
Bioinformatics scripts related to the manuscript entitled "THE ROLE OF STANDING VARIATION IN THE EVOLUTION OF WEEDINESS TRAITS IN SOUTH ASIAN WEEDY RICE (ORYZA SPP.).

Bioinformatics pipeline for G3_2018_200625 manuscript
Title: The role of standing variation in the evolution of weediness traits in South Asian weedy rice (Oryza Spp.)
Authors: Zhongyun Huang, Shannon Kelly, Rika Matsuo, Lin-Feng Li, Yaling Li, Kenneth M Olsen, Yulin Jia, Ana Caicedo


1	FastQC plot -> trim fastq [bwa] -> sai [samtools] -> sam -> filter uniq (XT:A:U and XT:A:M) [samtools] -> sort_bam [merge_bam.pl] -> merge bam [Multi_sam2.pl sam2.pl] -> VCF

2	Filter VCF by depth and quality (vcf.pl) -> filter.vcf [merge_snp.pl] -> merge_snp.txt [Splice.pl] -> temporary individuals [multi_replace.pl and replace.pl] -> temporary individuals [merge_replace.pl] -> merge_unmap.txt (all samples SNP matrix)

3	Merge_unmap.txt + group4.txt [chname.pl] -> merge_group_unmap_snp.txt
### group4.txt equal to sureselect_group_2016.xlsx ###

4	Merge_group_unmap_snp.txt + select_cover_region_for_select_snp.txt [select_gene_snp.pl] -> region_snp.txt [split_group.pl] -> *.group [count_new3.pl] -> *.new_group

5	region_snp.txt [group_sample_new.pl] -> group_sample_new.txt

6	Input: msu6.fa, cds_sort.gff, cds_over_fragment.txt <130 region>
Script: trans_non_length.pl
Output: cds_syn.txt

7	Input: *.new.group, cds_syn.txt, gene_region.*.txt
Script: trans_group_p.pl
Output: group_p.txt

8	Input: *.new.group, msu6.fa, cds.sort.gff
Script: trans_non_new.pl
Output: *.new.syn/nonsyn/silent.group

9	*.new.group + *.new.syn/nonsyn/silent.group + header.txt [watterson3_count.pl] -> *watterson3.count [merge_count.pl] -> merge_count.txt

10	Theta
Input: group_p.txt, header.txt, *.syn/nonsyn/silent.group, *.new.group, new_cover_region.txt
Script: watterson3_gene_new.pl and merge_watterson.pl
Output: *.new.total/syn/silent/nonsyn.theta.txt -> merge.fra.theta

11	Pi
Input: group_p.txt, header.txt, *.syn/nonsyn/silent.group, *.new.group, new_cover_region.txt 
Script: pi_gene_nei_1987_new_win.pl and merge_pi.pl
Output: *.new.total/syn/silent/nonsyn.nei1987_pi.txt -> merge.fra.pi

12	FST
Input: group_p.txt, header.txt, new_cover_region.txt
Script: multi_fst.pl and fst_gene_hudson1992.p and fst_total_second_new.pl 
Output: Hudson_fst and second_fst

13	Tajima’s D
Input: group_sample_new.txt, merge_count.txt, group_p.txt, merge_fra.pi
Script: d_final.pl
Output: Tajima’s D

