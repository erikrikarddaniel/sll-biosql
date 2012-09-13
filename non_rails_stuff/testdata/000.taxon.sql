-- root
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(1, 1, 1, 'no rank', 1, 0, 1, 1830838)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1, 'root', 'scientific name')
;
-- cellular organisms
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(102629, 131567, 1, 'no rank', 1, 0, 199140, 1830837)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(102629, 'cellular organisms', 'scientific name')
;
-- other sequences
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(12262, 28384, 1, 'no rank', 1, 0, 186244, 199139)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(12262, 'other sequences', 'scientific name')
;
-- unclassified sequences
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(10063, 12908, 1, 'no rank', 1, 0, 185380, 186243)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(10063, 'unclassified sequences', 'scientific name')
;
-- Viroids
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(10041, 12884, 1, 'superkingdom', 1, 0, 185202, 185379)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(10041, 'Viroids', 'scientific name')
;
-- Viruses
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(8380, 10239, 1, 'superkingdom', 1, 0, 2, 185201)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(8380, 'Viruses', 'scientific name')
;
-- Eukaryota
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(2170, 2759, 102629, 'superkingdom', 1, 0, 710171, 1830836)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(2170, 'Eukaryota', 'scientific name')
;
-- Archaea
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(1706, 2157, 102629, 'superkingdom', 1, 0, 697249, 710170)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(1706, 'Archaea', 'scientific name')
;
-- Bacteria
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(2, 2, 102629, 'superkingdom', 1, 0, 199141, 697248)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(2, 'Bacteria', 'scientific name')
;
-- E. coli hierarchy
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(     949, 1224, 2, 'phylum', 11, 0, 217876, 430259)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(949, 'Proteobacteria', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(     956, 1236, 949, 'class', 11, 0, 217877, 334106)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(956, 'Gammaproteobacteria', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   66867, 91347, 956, 'order', 11, 0, 253310, 275889)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(66867, 'Enterobacteriales', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(     424, 543, 66867, 'family', 11, 0, 253311, 275852)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(424, 'Enterobacteriaceae', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(     439, 561, 424, 'genus', 11, 0, 258536, 262139)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(439, 'Escherichia', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(     440, 562, 439, 'species', 11, 0, 258537, 261738)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(440, 'Escherichia coli', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   59589, 83334, 440, 'no rank', 11, 0, 258600, 258675)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(59589, 'Escherichia coli O157:H7', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(  468316, 544404, 59589, 'no rank', 11, 0, 258635, 258636)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(468316, 'Escherichia coli O157:H7 str. TW14359', 'scientific name')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(468316, 'Escherichia coli O157:H7 strain TW14359', 'equivalent name')
;
-- Pseudomonas aeruginosa
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   49616, 72274, 956, 'order', 11, 0, 220326, 253309)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(49616, 'Pseudomonadales', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(  106272, 135621, 49616, 'family', 11, 0, 227631, 253182)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(106272, 'Pseudomonadaceae', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(     227, 286, 106272, 'genus', 11, 0, 227712, 252909)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(227, 'Pseudomonas', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(  107383, 136841, 227, 'species group', 11, 0, 228605, 228834)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(107383, 'Pseudomonas aeruginosa group', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(     228, 287, 107383, 'species', 11, 0, 228606, 228783)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(228, 'Pseudomonas aeruginosa', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(  173252, 208964, 228, 'no rank', 11, 0, 228609, 228642)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(173252, 'Pseudomonas aeruginosa PAO1', 'scientific name')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(173252, 'Pseudomonas aeruginosa PA01', 'misspelling')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(173252, 'Pseudomonas aeruginosa str. PAO1', 'synonym')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(173252, 'Pseudomonas aeruginosa str. PA01', 'misspelling')
;
-- Homo sapiens neanderthalensis
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   15658, 33154, 2170, 'no rank', 1, 1, 988756, 1784099)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(15658, 'Opisthokonta', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   15699, 33208, 15658, 'kingdom', 1, 1, 1153253, 1783862)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(15699, 'Metazoa', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    4929, 6072, 15699, 'no rank', 1, 5, 1157166, 1783621)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(4929, 'Eumetazoa', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   15701, 33213, 4929, 'no rank', 1, 5, 1167527, 1783620)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(15701, 'Bilateria', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   15726, 33316, 15701, 'no rank', 1, 5, 1178748, 1783515)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(15726, 'Coelomata', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   15889, 33511, 15726, 'no rank', 1, 5, 1653849, 1783514)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(15889, 'Deuterostomia', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    6268, 7711, 15889, 'phylum', 1, 5, 1658586, 1783173)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(6268, 'Chordata', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   65235, 89593, 6268, 'subphylum', 1, 2, 1659421, 1783164)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(65235, 'Craniata', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    6297, 7742, 65235, 'no rank', 1, 2, 1659422, 1783085)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(6297, 'Vertebrata', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    6317, 7776, 6297, 'superclass', 1, 2, 1659423, 1782928)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(6317, 'Gnathostomata', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   90049, 117570, 6317, 'no rank', 1, 2, 1661916, 1782927)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(90049, 'Teleostomi', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   90050, 117571, 90049, 'no rank', 1, 2, 1661917, 1782926)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(90050, 'Euteleostomi', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    6732, 8287, 90050, 'no rank', 1, 2, 1710388, 1782925)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(6732, 'Sarcopterygii', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   15426, 32523, 6732, 'no rank', 1, 2, 1710441, 1782912)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(15426, 'Tetrapoda', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   15427, 32524, 15426, 'no rank', 1, 2, 1723420, 1782911)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(15427, 'Amniota', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   21960, 40674, 15427, 'class', 1, 2, 1765309, 1782910)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(21960, 'Mammalia', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   15428, 32525, 21960, 'no rank', 1, 2, 1765332, 1782905)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(15428, 'Theria', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    7634, 9347, 15428, 'no rank', 1, 2, 1766375, 1782904)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(7634, 'Eutheria', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(  264809, 314146, 7634, 'superorder', 1, 2, 1774440, 1782903)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(264809, 'Euarchontoglires', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    7721, 9443, 264809, 'order', 1, 2, 1774513, 1776036)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(7721, 'Primates', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(  321604, 376913, 7721, 'suborder', 1, 2, 1774932, 1776035)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(321604, 'Haplorrhini', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(  264946, 314293, 321604, 'infraorder', 1, 2, 1774933, 1776008)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(264946, 'Simiiformes', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    7788, 9526, 264946, 'parvorder', 1, 2, 1775382, 1776007)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(7788, 'Catarrhini', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(  264948, 314295, 7788, 'superfamily', 1, 2, 1775865, 1776006)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(264948, 'Hominoidea', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    7851, 9604, 264948, 'family', 1, 2, 1775948, 1776005)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(7851, 'Hominidae', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(  171934, 207598, 7851, 'subfamily', 1, 2, 1775949, 1775990)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(171934, 'Homininae', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    7852, 9605, 171934, 'genus', 1, 2, 1775982, 1775989)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(7852, 'Homo', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(    7853, 9606, 7852, 'species', 1, 2, 1775983, 1775986)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(7853, 'Homo sapiens', 'scientific name')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(7853, 'man', 'common name')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(7853, 'human', 'genbank common name')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(7853, 'Homo sapiens Linnaeus, 1758', 'authority')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(   42080, 63221, 7853, 'subspecies', 1, 2, 1775984, 1775985)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(42080, 'Homo sapiens neanderthalensis', 'scientific name')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(42080, 'Homo neanderthalensis', 'synonym')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(42080, 'Neanderthal', 'common name')
;
-- Phage: Enterobacteria phage PRD1
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(17322, 35237, 8380, 'no rank', 1, 0, 7583, 16764)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(17322, 'dsDNA viruses, no RNA stage', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(8704, 10656, 17322, 'family', 11, 0, 10548, 10575)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(8704, 'Tectiviridae', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(8705, 10657, 8704, 'genus', 11, 0, 10549, 10574)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(8705, 'Tectivirus', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(8706, 10658, 8705, 'species', 11, 0, 10550, 10561)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(8706, 'Enterobacteria phage PRD1', 'scientific name')
;
-- Streptomyces phage VWB
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(12682, 28883, 17322, 'order', 11, 0, 10582, 13899)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(12682, 'Caudovirales', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(8735, 10699, 12682, 'family', 11, 0, 11591, 13326)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(8735, 'Siphoviridae', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(152812, 186765, 8735, 'genus', 11, 0, 11592, 11717)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(152812, 'Lambda-like viruses', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(284615, 335795, 152812, 'no rank', 11, 0, 11613, 11708)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(284615, 'unclassified Lambda-like viruses', 'scientific name')
;
INSERT INTO taxon(taxon_id, ncbi_taxon_id, parent_taxon_id, node_rank, genetic_code, mito_genetic_code, left_value, right_value)
  VALUES(8737, 10702, 284615, 'species', 11, 0, 11616, 11617)
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(8737, 'Streptomyces phage VWB', 'scientific name')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(8737, 'Bacteriophage VWB', 'synonym')
;
INSERT INTO taxon_name(taxon_id, name, name_class)
  VALUES(8737, 'Actinophage VWB', 'synonym')
;
