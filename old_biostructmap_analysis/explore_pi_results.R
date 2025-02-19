# ------------------------------------------------------- #
#   Brad Broyles, Purdue University, He Lab - 7/7/23      #
#                                                         #
#   Unpack results from Biostructmap nucleotide pi        #
#   Save one dataframe that stores values by residue      #
#   For each vaccine candidate protein                    #
#                                                         #
#   Also indicate which residues were found in epitopes   #
# ------------------------------------------------------- #

# load libraries
library(tidyverse)
library(bio3d)

## function for fixing pdb indices to original 3d7 location
fix_indices = function(csv, pdb, factor = 0){
  bye = unique(pdb$atom$resno)
  
  mi = min(bye)
  ma = max(bye)
  
  miss = which(!mi:ma %in% bye)
  
  csv$updated = csv$reference_residue
  for(i in miss){
    ro = which(csv$updated>=i)
    csv$updated[ro] = csv$updated[ro] + 1
  }
  
  csv$updated = csv$updated + factor
  
  ## I want to add the pdb sequence here as well
  csv$seq = pdbseq(pdb)
  
  return(csv)
}

# ama1 -- 107 start ----
csv = read.csv('tajima_d_models/ama1_trim_pi.csv')
pdb = read.pdb('tajima_d_models/ama1_trim_pi.pdb')

ama1 = fix_indices(csv,pdb,factor = 106) # start minus 1 for conversion factor

ama1$score = ama1$score %>% as.numeric()

# CSP -- 309 start ----
csv = read.csv('tajima_d_models/csp_trim_pi.csv')
pdb = read.pdb('tajima_d_models/csp_trim_pi.pdb')

csp = fix_indices(csv,pdb,factor = 308)

csp$score = csp$score %>% as.numeric()

# Rh5 -- 146 start ----
csv = read.csv('tajima_d_models/rh5_trim_pi.csv')
pdb = read.pdb('tajima_d_models/rh5_trim_pi.pdb')

rh5 = fix_indices(csv,pdb,factor = 145)

rh5$score = rh5$score %>% as.numeric()

# Pfs25 -- 23 start ----
csv = read.csv('tajima_d_models/Pfs25_trim_pi.csv')
pdb = read.pdb('tajima_d_models/Pfs25_trim_pi.pdb')

pfs25 = fix_indices(csv,pdb,factor = 22)

pfs25$score = pfs25$score %>% as.numeric()

# Pfs4845 -- 45 start ----
csv = read.csv('tajima_d_models/Pfs4845_trim_pi.csv')
pdb = read.pdb('tajima_d_models/Pfs4845_trim_pi.pdb')

pfs4845 = fix_indices(csv,pdb,factor = 44)

pfs4845$score = pfs4845$score %>% as.numeric()

# Pfs47 -- 22 start ----
csv = read.csv('tajima_d_models/Pfs47_long_trim_pi.csv')
pdb = read.pdb('tajima_d_models/Pfs47_long_trim_pi.pdb')

pfs47 = fix_indices(csv,pdb,factor = 21)

pfs47$score = pfs47$score %>% as.numeric()

########################################################
# Pfs230.1 -- 552 start ----
trib = tribble(~seg,~mi,~ma,
               1, 552, 890,   
               2, 730, 1136,
               3, 915, 1278,
               4, 1133, 1435,
               5, 1282, 1563,
               6, 1432, 1910,
               7, 1691, 2038,
               8, 1907, 2202,
               9, 2049, 2377,
               10, 2201, 2666,
               11, 2445, 2830,
               12, 2663, 2982,
               13, 2828, 3116)

csv = read.csv('tajima_d_models/pfs230/pfs230_seg1_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg1_trim_pi.pdb')

pfs230.1 = fix_indices(csv,pdb,factor = 551)

pfs230.1$score = pfs230.1$score %>% as.numeric()

# Pfs230.3 -- 915 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg3_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg3_trim_pi.pdb')

pfs230.3 = fix_indices(csv,pdb,factor = 914)

pfs230.3$score = pfs230.3$score %>% as.numeric()

# Pfs230.5 -- 1282 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg5_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg5_trim_pi.pdb')

pfs230.5 = fix_indices(csv,pdb,factor = 1281)

pfs230.5$score = pfs230.5$score %>% as.numeric()

# Pfs230.7 -- 1691 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg7_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg7_trim_pi.pdb')

pfs230.7 = fix_indices(csv,pdb,factor = 1690)

pfs230.7$score = pfs230.7$score %>% as.numeric()

# Pfs230.9 -- 2049 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg9_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg9_trim_pi.pdb')

pfs230.9 = fix_indices(csv,pdb,factor = 2048)

pfs230.9$score = pfs230.9$score %>% as.numeric()

# Pfs230.11 -- 2445 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg11_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg11_trim_pi.pdb')

pfs230.11 = fix_indices(csv,pdb,factor = 2444)

pfs230.11$score = pfs230.11$score %>% as.numeric()

# Pfs230.13 -- 2828 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg13_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg13_trim_pi.pdb')

pfs230.13 = fix_indices(csv,pdb,factor = 2827)

pfs230.13$score = pfs230.13$score %>% as.numeric()

# Pfs230.2 -- 730 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg2_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg2_trim_pi.pdb')

pfs230.2 = fix_indices(csv,pdb,factor = 729)

pfs230.2$score = pfs230.2$score %>% as.numeric()

# Pfs230.4 -- 1133 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg4_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg4_trim_pi.pdb')

pfs230.4 = fix_indices(csv,pdb,factor = 1132)

pfs230.4$score = pfs230.4$score %>% as.numeric()

# Pfs230.6 -- 1432 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg6_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg6_trim_pi.pdb')

pfs230.6 = fix_indices(csv,pdb,factor = 1431)

pfs230.6$score = pfs230.6$score %>% as.numeric()

# Pfs230.8 -- 1907 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg8_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg8_trim_pi.pdb')

pfs230.8 = fix_indices(csv,pdb,factor = 1906)

pfs230.8$score = pfs230.8$score %>% as.numeric()

# Pfs230.10 -- 2201 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg10_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg10_trim_pi.pdb')

pfs230.10 = fix_indices(csv,pdb,factor = 2200)

pfs230.10$score = pfs230.10$score %>% as.numeric()

# Pfs230.12 -- 2663 start ----
csv = read.csv('tajima_d_models/pfs230/pfs230_seg12_trim_pi.csv')
pdb = read.pdb('tajima_d_models/pfs230/pfs230_seg12_trim_pi.pdb')

pfs230.12 = fix_indices(csv,pdb,factor = 2662)

pfs230.12$score = pfs230.12$score %>% as.numeric()

#########################################################
## COMBINE ALL DATA INTO ONE TABLE -----
tib = rbind(ama1 %>% mutate(name = 'ama1'),
            csp %>% mutate(name = 'csp'),
            rh5 %>% mutate(name = 'rh5'),
            pfs25 %>% mutate(name = 'pfs25'),
            pfs4845 %>% mutate(name = 'pfs4845'),
            pfs47 %>% mutate(name = 'pfs47'),
            pfs230.1 %>% mutate(name = 'pfs230.1'),
            pfs230.3 %>% mutate(name = 'pfs230.3'),
            pfs230.5 %>% mutate(name = 'pfs230.5'),
            pfs230.7 %>% mutate(name = 'pfs230.7'),
            pfs230.9 %>% mutate(name = 'pfs230.9'),
            pfs230.11 %>% mutate(name = 'pfs230.11'),
            pfs230.13 %>% mutate(name = 'pfs230.13'),
            pfs230.2 %>% mutate(name = 'pfs230.2'),
            pfs230.4 %>% mutate(name = 'pfs230.4'),
            pfs230.6 %>% mutate(name = 'pfs230.6'),
            pfs230.8 %>% mutate(name = 'pfs230.8'),
            pfs230.10 %>% mutate(name = 'pfs230.10'),
            pfs230.12 %>% mutate(name = 'pfs230.12')
)

## add antibody information ----
tib$epitope = 0
pdb = read.pdb('antibody interface/csp_interface_four.pdb')$atom %>% filter(elety == 'CA')
tib$epitope[which(tib$name=='csp')] = pdb$b

pdb = read.pdb('antibody interface/ama1_interface_four.pdb')$atom %>% filter(elety == 'CA')
tib$epitope[which(tib$name=='ama1')] = pdb$b

pdb = read.pdb('antibody interface/rh5_interface_four.pdb')$atom %>% filter(elety == 'CA')
tib$epitope[which(tib$name=='rh5')] = pdb$b

pdb = read.pdb('antibody interface/pfs25_interface_four.pdb')$atom %>% filter(elety == 'CA')
tib$epitope[which(tib$name=='pfs25')] = pdb$b

pdb = read.pdb('antibody interface/pfs4845_interface_four.pdb')$atom %>% filter(elety == 'CA')
tib$epitope[which(tib$name=='pfs4845')] = pdb$b

pdb = read.pdb('antibody interface/pfs230_interface_four.pdb')$atom %>% filter(elety == 'CA')
tib$epitope[which(tib$name=='pfs230.1')] = pdb$b

pdb = read.pdb('antibody interface/pfs47_interface_four.pdb')$atom %>% filter(elety == 'CA')
tib$epitope[which(tib$name=='pfs47')] = pdb$b

## save dataset that combines pi scores and epitope positions for each protein ----
## Open this dataset in explore_tajima to add tajima scores to this data
saveRDS(tib,'combined_pi.rds')




