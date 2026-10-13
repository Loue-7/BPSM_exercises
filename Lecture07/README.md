# BPSM Lecture 07: Conservation plots from NCBI sequences

Pipeline: NCBI search → FASTA → Clustal Omega alignment → EMBOSS plotcon

## 1. Nematode COX1 (884 sequences)
esearch -db protein -query "txid6231[Organism:exp] AND (COX1[Gene Name] OR CO1[Gene Name]) NOT partial" | efetch -format fasta > nem_cox1_edirect.fasta
clustalo -i nem_cox1_edirect.fasta -o cytoxseqs.aln.fasta --threads=4
plotcon -sequences cytoxseqs.aln.fasta -winsize 4 -graph svg -goutfile cox1_win4 -auto

## 2. Primate HOXA7 (69 sequences)
esearch -db protein -query "txid9443[Organism:exp] AND HOXA7[Gene Name] AND 200:300[SLEN] NOT partial" | efetch -format fasta > primate_hoxa7.fasta
clustalo -i primate_hoxa7.fasta -o primate_hoxa7.aln.fasta --threads=4
plotcon -sequences primate_hoxa7.aln.fasta -winsize 4 -graph svg -goutfile primate_hoxa7_win4 -auto

## Lessons / checkpoints
- Brackets matter: missing ")" let non-nematodes (tapeworm, whitefly) into results.
- Check length distribution: a 2063 aa record (NCOA6, mis-annotated as HOXA7) inflated the alignment to 2067 columns; fixed with 200:300[SLEN].
- Taxon choice: within primates HOXA7 is conserved almost everywhere; peaks still match YPWM hexapeptide (col 120) and homeodomain helix 3 WFQNRR (col 177).
