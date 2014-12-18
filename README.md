## mTOR in Penile SCC

### Description
This repository contains information on patients with penile squamous cell carcinoma (SCC) in whom the expression of the mTOR pathway was assessed. The repository contains the following files, pages, and folders:

#### Data Management and R Scripts
This section contains 6 files:

* [TidyDataset.R](https://github.com/alcideschaux/Penis_mTOR/blob/master/TidyDataset.R): The R script that was used for handling the Stata "penile tma 6-11-14.dta" file sent by Mark Ball, M.D. (Department of Urology, The Johns Hopkins University) on 06/11/2014 09:18 AM (not included).
* [PenisDataset.csv](https://github.com/alcideschaux/Penis_mTOR/blob/master/PenisDataset.csv): The output of the aforementioned R script to obtain the dataset that was used for the analysis.
* [CodeBook.md](https://github.com/alcideschaux/Penis_mTOR/blob/master/CodeBook.md): The codebook containing information on variables names, labels, type and units included in the final dataset.
* [StandardAnalysis3.R](https://github.com/alcideschaux/Penis_mTOR/blob/master/RFUN/StandardAnalysis3.R): File containing the R script used for the statistical analysis carried out.
* [NicePlots.R](https://github.com/alcideschaux/Penis_mTOR/blob/master/RFUN/NicePlots.R): File containing the R script used for generating the plots.
* [NiceTables.R](https://github.com/alcideschaux/Penis_mTOR/blob/master/RFUN/NiceTables.R): File containing the R script used for generating the tables.

#### Descriptive Analysis
This section contains the description of the variables included in the dataset:

* [Results:](https://github.com/alcideschaux/Penis_mTOR/blob/master/0_mTORpenis_Descriptive.md) This page contains the results of the analysis.
* [R code:](https://github.com/alcideschaux/Penis_mTOR/blob/master/0_mTORpenis_Descriptive.Rmd) This file contains the R code that was used for analysis.

#### PTEN Expression
This section contains the analysis of `PTEN` expression in penile SCC:

* [Results:](https://github.com/alcideschaux/Penis_mTOR/blob/master/1_mTORpenis_PTEN.md) This page contains the results of the analysis.
* [R code:](https://github.com/alcideschaux/Penis_mTOR/blob/master/1_mTORpenis_PTEN.Rmd) This file contains the R code that was used for analysis.

#### phos-AKT Expression
This section contains the analysis of `phos-AKT` expression in penile SCC:

* [Results:](https://github.com/alcideschaux/Penis_mTOR/blob/master/2_mTORpenis_AKT.md) This page contains the results of the analysis.
* [R code:](https://github.com/alcideschaux/Penis_mTOR/blob/master/2_mTORpenis_AKT.Rmd) This file contains the R code that was used for analysis.

#### phos-mTOR Expression
This section contains the analysis of `phos-mTOR` expression in penile SCC:

* [Results:](https://github.com/alcideschaux/Penis_mTOR/blob/master/3_mTORpenis_mTOR.md) This page contains the results of the analysis.
* [R code:](https://github.com/alcideschaux/Penis_mTOR/blob/master/3_mTORpenis_mTOR.Rmd) This file contains the R code that was used for analysis.

#### phos-S6 Expression
This section contains the analysis of `phos-S6` expression in penile SCC:

* [Results:](https://github.com/alcideschaux/Penis_mTOR/blob/master/4_mTORpenis_pS6.md) This page contains the results of the analysis.
* [R code:](https://github.com/alcideschaux/Penis_mTOR/blob/master/4_mTORpenis_pS6.Rmd) This file contains the R code that was used for analysis.

#### phos-4EBP1 Expression
This section contains the analysis of `phos-4EBP1` expression in penile SCC:

* [Results:](https://github.com/alcideschaux/Penis_mTOR/blob/master/5_mTORpenis_EBP1.md) This page contains the results of the analysis.
* [R code:](https://github.com/alcideschaux/Penis_mTOR/blob/master/5_mTORpenis_EBP1.Rmd) This file contains the R code that was used for analysis.

#### p27 Expression
This section contains the analysis of `p27` expression in penile SCC:

* [Results:](https://github.com/alcideschaux/Penis_mTOR/blob/master/6_mTORpenis_p27.md) This page contains the results of the analysis.
* [R code:](https://github.com/alcideschaux/Penis_mTOR/blob/master/6_mTORpenis_p27.Rmd) This file contains the R code that was used for analysis.

#### Figures
All figures in PNG format from the previous analyses are located [here](https://github.com/alcideschaux/Penis_mTOR/blob/master/figure).

***

### Aim
The aim of this project is to evaluate the immunohistochemical expression of members of the mTOR pathway, accessing the relationship between expression levels and clinicopathologic and outcome features, and building prognostic models of penile cancer recurrence, progression, dissemination, overall mortality and cancer-related mortality.

***

### Material & Method
#### Patient Cohort
Fifty-nine in situ and invasive penile squamous cell carcinomas from fifty-three different patients diagnosed between 1985 and 2013 were retrieved from our surgical pathology archives. Histologic subtyping was carried out in whole tissue sections using the morphologic criteria presented in the Atlas of Tumor Pathology of the Armed Forces Institute of Pathology. Other pathologic features of the tumor were also re-assessed to include tumor grade, tumor thickness, presence of angiolymphatic and perineural invasion, extent of invasion, urethral involvement, presence of metastasis, and pathologic and clinical stage.

Representative formalin-fixed, paraffin-embedded archival blocks were used for the construction of two high-density tissue microarrays (TMAs). Tumors and paired nonneoplastic tissue were spotted 3 to 5 times each using 1.6-mm cores.

Digital medical records were reviewed for pertinent clinical information including age, gender, anatomical site of involvement, date of surgery, type of treatment, recurrence, progression, death status, cause of death and last follow up date. Recurrence was defined as development of a new tumor in the same location as the prior tumor (local recurrence). Progression was defined as the presence of local or distant metastasis after the primary treatment.

#### Immunohistochemistry
Immunohistochemistry was performed for the following proteins: PTEN, phosphorylated AKT (phos-AKT), phosphorylated mTOR (phos-mTOR), phosphorylated S6 (phos-S6), phosphorylated 4EBP1 (phos-4EBP1), and p27.  Immunostaining was performed on formalin-fixed, paraffin-embedded tissue sections using the PowerVision Poly-HRP IHC Detection Systems (Leica Microsystems, Bannockburn, IL). Sections were deparaffinized, rehydrated, and subjected to heat induced antigen retrieval with a buffer solution using a steamer. Sections were then incubated with the appropriate primary antibody. Following the application of an anti-Rabbit or anti-Mouse poly-HRP secondary, the slides were developed using 3-3'-diaminobenzidine chromogen and counterstained with hematoxylin. Proper cell lines were used as external controls, and internal controls were checked for negative and positive immunohistochemical expression.

#### Scoring System
TMA spots stained with each marker were evaluated for pattern of staining (nuclear vs. cytoplasmic), extent (percent of positive cells) and intensity (0 to 3+ score). PTEN positivity was evaluated as nuclear and/or cytoplasmic pattern while phos-AKT and p27 were evaluated as exclusively nuclear, and phos-mTOR, phos-S6 and 4EBP1 as exclusively cytoplasmic.

An H-scpre was used to evaluate not only the percentage of positive cells but also the staining intensity in the positive cells. Accordingly, an H-score was assigned to each TMA spot as the sum of the products of the intensity (0 for negative, 1 for weakly positive, 2 for moderately positive, and 3 for strongly positive) by the extent of immunoexpression (0-100), obtaining a value from 0 to 300. Final H-scores for each case were obtained as the median of all the individual H-scores of each TMA spot and these were used during statistical analyses for all markers.

#### Statistical Analysis
Associations between variables were evaluated using the Fisher's exact test. Predictor variables were grouped in clinical features (age and race), pathologic features (histologic subtype, anatomical site, anatomical level, histologic grade, tumor thickness, tumor invasion of penile urethra, lymphovascular invasion, perineural invasion, pT stage, pN stage, clinical stage, and inguinal lymph node metastasis), HPV status, and immunohistochemical expression or mTOR markers. For time-to-event analysis endpoints included tumor recurrence, tumor progression, distant metastasis, overall mortality, and cancer-related mortality.

Survival curves were built using the Kaplan-Meier method and compared using the log-rank (Mantel-Cox) test. Odds ratios and hazard ratios were estimated using unconditional logistic regression and Cox's proportional hazard regression, respectively, for each of the aforementioned endpoints. A 2-tailed P < 0.05 was required for statistical significance. Raw P values were adjusted using Hommel's correction to control for family-wise error rates.

Data were analyzed by [Alcides Chaux](https://github.com/alcideschaux) using [R](http://www.r-project.org) version 3.1.1 “Sock it to Me” (R Foundation for Statistical Computing, Vienna, Austria). Results were written using RMarkDown in [RStudio](http://www.rstudio.com) version 0.98.932 and the [knitr](http://cran.r-project.org/web/packages/knitr/index.html) package version 1.6 by [Yihui Xie](http://yihui.name/knitr). 

***

### Researchers
* Enrico Munari<sup>1</sup>
* Alcides Chaux<sup>1,2</sup>
* Nilda Gonzalez-Roibon<sup>1</sup>
* Mark W. Ball<sup>3</sup>
* Sheila F. Faraj<sup>1</sup>
* Stephania M. Bezerra<sup>1</sup>
* Rajni Sharma<sup>1</sup>
* Trinity J. Bivalacqua<sup>3</sup>
* Arthur L. Burnett<sup>3</sup>
* George J. Netto<sup>1,2,3</sup>

<sup>1</sup>Department of Pathology, The Johns Hopkins Medical Institutions, Baltimore, MD 21231  
<sup>2</sup>Norte University, Office of Scientific Research, Asunción, Paraguay  
<sup>3</sup>Department of Urology, The Johns Hopkins Medical Institutions, Baltimore, MD 21231  
<sup>4</sup>Department of Oncology, The Johns Hopkins Medical Institutions, Baltimore, MD 21231