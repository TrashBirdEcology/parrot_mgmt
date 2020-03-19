Using GeoDeepDive (xDD) to Ping the White and Grey Literature for Parrot
Management
================
Last updated: 2020-03-19

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-lightgrey.svg)](https://www.tidyverse.org/lifecycle/#experimental)

## About

This project seeks to identify publications within which keywords
related to parrot management or parrot culling has been referenced or
mentioned. This project uses pre-extracted information available via API
from the [GeoDeepDive](https://geodeepdive.org) infrastructure.

Note: This readme is difficult, I know, but is not currenlty intended
for a broad audience. Note2: Reproduction requires some knowledge or
patience with Jupyter and R.

## Hit up the GeoDeepDive (xDD) API using a Jupyter Notebook

Open the Jupyter notebook in your web browser by doing the following:  
1\. Open terminal (Mac) or Command Line (Windows, Linux)  
2\. Navigate to this directory (`cd ~/path/to/parrot_xdd/`)  
3\. Open the .ipynb (type: `jupyter notebook`). This opens the notebook
directory in your web browser.  
4\. Navigate to (i.e. click) the file `parrot_xDD.ipynb`: this will open
the notebook and a Kernel.  
5\. Edit the terms (keywords, search phrases). Edit the code chunk
containing terms. See section: `Set a term or loop through terms`, and
edit inside brackets at `terms = [...]`  
6\. Save the notebook (it typically autosaves but just to be safe).
Ctrl+S (MS) or Cmd+S (Mac) or \>File\>Save and Checkpoint  
7\. Execute the notebook (Run or \>Kernel\>Restart and Run All)  
8\. Navigate to the results
(~/xdd\_json/)

## Import the JSON results to R

``` r
# Import the JSON files and munge into a single data frame ----------------
files <- list.files(here::here("xdd_json"), pattern='.txt', full.names=TRUE)
# Identify and delete the empty .txt files. Yes, this is poor practice but oh well!
for(i in seq_along(files)){
  if(i==1) keep <-NULL
if(file.info(files[i])$size > 5){ # retrieve file only if it's >5bytes.
  keep <- c(keep,i)}
}
```

## Import and munge the xdd json into an R df

``` r
parrot_xdd <- get_xdd_df(files[keep])
parrot_unique <- parrot_xdd %>% distinct(doi, .keep_all = TRUE) %>% dplyr::select(-searchterm)
```

## Overview of parrot records (N= 50) retrieved from the GeoDeepDive database.

We have used various search terms to identify potential works of
relevance to parrot management. Using various searches (see
`parrot_xdd.ipynb`), we identified **51** unique publications.

<!-- Exact search phrase | Number of unique records in xDD/GDD  -->

<!-- --------------|---- -->

<!-- "management of parrot*" | 0 -->

<!-- "parrot control" | 0 -->

<!-- "parrot management" | 0 -->

<table>

<thead>

<tr>

<th style="text-align:left;">

title

</th>

<th style="text-align:right;">

coveryear

</th>

<th style="text-align:left;">

pubname

</th>

<th style="text-align:left;">

doi

</th>

<th style="text-align:left;">

URL

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Monk Parakeets An Expanding Problem on Power Lines and Other Electrical
Utility Structures

</td>

<td style="text-align:right;">

2008

</td>

<td style="text-align:left;">

Environment Concerns in Rights-of-Way Management 8th International
Symposium 12–16 September 2004 Saratoga Springs, New York, USA

</td>

<td style="text-align:left;">

10.1016/B978-044453223-7.50043-5

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/B9780444532237500435>

</td>

</tr>

<tr>

<td style="text-align:left;">

Contaminant-induced feminization and demasculinization of nonmammalian
vertebrate males in aquatic environments

</td>

<td style="text-align:right;">

2006

</td>

<td style="text-align:left;">

Environmental Research

</td>

<td style="text-align:left;">

10.1016/j.envres.2005.04.002

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/S0013935105000551>

</td>

</tr>

<tr>

<td style="text-align:left;">

Avian quarantine

</td>

<td style="text-align:right;">

1997

</td>

<td style="text-align:left;">

Australian Veterinary Journal

</td>

<td style="text-align:left;">

10.1111/j.1751-0813.1997.tb15361.x

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/j.1751-0813.1997.tb15361.x>

</td>

</tr>

<tr>

<td style="text-align:left;">

The evolution of plumage colouration in parrots: a review

</td>

<td style="text-align:right;">

2010

</td>

<td style="text-align:left;">

Emu - Austral Ornithology

</td>

<td style="text-align:left;">

10.1071/MU09076

</td>

<td style="text-align:left;">

<https://www.tandfonline.com/doi/full/10.1071/MU09076>

</td>

</tr>

<tr>

<td style="text-align:left;">

Plant invasions in the rivers of the Iberian Peninsula, south-western
Europe: A review

</td>

<td style="text-align:right;">

2013

</td>

<td style="text-align:left;">

Plant Biosystems - An International Journal Dealing with all Aspects of
Plant Biology

</td>

<td style="text-align:left;">

10.1080/11263504.2013.861539

</td>

<td style="text-align:left;">

<http://www.tandfonline.com/doi/abs/10.1080/11263504.2013.861539>

</td>

</tr>

<tr>

<td style="text-align:left;">

Using Myriophyllum aquaticum (Vell.) Verdc. to remove heavy metals from
contaminated water: Better dead or alive?

</td>

<td style="text-align:right;">

2018

</td>

<td style="text-align:left;">

Journal of Environmental Management

</td>

<td style="text-align:left;">

10.1016/j.jenvman.2018.02.074

</td>

<td style="text-align:left;">

<https://www.sciencedirect.com/science/article/pii/S0301479718301816>

</td>

</tr>

<tr>

<td style="text-align:left;">

Projections of the oval nucleus of the hyperstriatum ventrale in the
budgerigar: Relationships with the auditory system

</td>

<td style="text-align:right;">

2001

</td>

<td style="text-align:left;">

The Journal of Comparative Neurology

</td>

<td style="text-align:left;">

10.1002/cne.1115

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1002/cne.1115>

</td>

</tr>

<tr>

<td style="text-align:left;">

Harvesting, local trade, and conservation of parrots in the Northeastern
Peruvian Amazon

</td>

<td style="text-align:right;">

2003

</td>

<td style="text-align:left;">

Biological Conservation

</td>

<td style="text-align:left;">

10.1016/S0006-3207(03)00071-5

</td>

<td style="text-align:left;">

<https://www.sciencedirect.com/science/article/pii/S0006320703000715>

</td>

</tr>

<tr>

<td style="text-align:left;">

KERATOCONJUNCTIVITIS AND CHLAMYDIOSIS IN CAGE BIRDS

</td>

<td style="text-align:right;">

1974

</td>

<td style="text-align:left;">

Australian Veterinary Journal

</td>

<td style="text-align:left;">

10.1111/j.1751-0813.1974.tb14106.x

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/j.1751-0813.1974.tb14106.x>

</td>

</tr>

<tr>

<td style="text-align:left;">

Assessment of UAV Operator Workload in A Reconfigurable Multi-Touch
Ground Control Station Environment

</td>

<td style="text-align:right;">

2016

</td>

<td style="text-align:left;">

Journal of Unmanned Vehicle Systems

</td>

<td style="text-align:left;">

10.1139/juvs-2015-0039

</td>

<td style="text-align:left;">

<http://www.nrcresearchpress.com/doi/10.1139/juvs-2015-0039>

</td>

</tr>

<tr>

<td style="text-align:left;">

Drone services: issues in drones for location-based services from
human-drone interaction to information processing

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

Journal of Location Based Services

</td>

<td style="text-align:left;">

10.1080/17489725.2018.1564845

</td>

<td style="text-align:left;">

<https://www.tandfonline.com/doi/full/10.1080/17489725.2018.1564845>

</td>

</tr>

<tr>

<td style="text-align:left;">

Certified organic agriculture in China and Brazil: Market accessibility
and outcomes following adoption

</td>

<td style="text-align:right;">

2010

</td>

<td style="text-align:left;">

Ecological Economics

</td>

<td style="text-align:left;">

10.1016/j.ecolecon.2010.04.016

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/S092180091000159X>

</td>

</tr>

<tr>

<td style="text-align:left;">

ANATOMY OF A BOTTLENECK: DIAGNOSING FACTORS LIMITING POPULATION GROWTH
IN THE PUERTO RICAN PARROT

</td>

<td style="text-align:right;">

2008

</td>

<td style="text-align:left;">

Ecological Monographs

</td>

<td style="text-align:left;">

10.1890/07-0018.1

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1890/07-0018.1>

</td>

</tr>

<tr>

<td style="text-align:left;">

Strategic collection planning: Theory and practice

</td>

<td style="text-align:right;">

1995

</td>

<td style="text-align:left;">

Zoo Biology

</td>

<td style="text-align:left;">

10.1002/zoo.1430140103

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1002/zoo.1430140103>

</td>

</tr>

<tr>

<td style="text-align:left;">

The effect of a closed area and beach seine exclusion on coral reef fish
catches

</td>

<td style="text-align:right;">

2001

</td>

<td style="text-align:left;">

Fisheries Management and Ecology

</td>

<td style="text-align:left;">

10.1046/j.1365-2400.2001.00239.x

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1046/j.1365-2400.2001.00239.x>

</td>

</tr>

<tr>

<td style="text-align:left;">

A novel herpesvirus associated with respiratory disease in Bourke’s
parrots ( Neopsephotus bourkii )

</td>

<td style="text-align:right;">

2012

</td>

<td style="text-align:left;">

Avian Pathology

</td>

<td style="text-align:left;">

10.1080/03079457.2012.732692

</td>

<td style="text-align:left;">

<http://www.tandfonline.com/doi/abs/10.1080/03079457.2012.732692>

</td>

</tr>

<tr>

<td style="text-align:left;">

Avian research in the Caribbean: past contributions and current
priorities

</td>

<td style="text-align:right;">

2012

</td>

<td style="text-align:left;">

Journal of Field Ornithology

</td>

<td style="text-align:left;">

10.1111/j.1557-9263.2012.00361.x

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/j.1557-9263.2012.00361.x>

</td>

</tr>

<tr>

<td style="text-align:left;">

A review and an empirical analysis of privacy policy and notices for
consumer Internet of things

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

Security and Privacy

</td>

<td style="text-align:left;">

10.1002/spy2.15

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1002/spy2.15>

</td>

</tr>

<tr>

<td style="text-align:left;">

Nest tree selection in a crowded introduced population of Monk Parakeet
( Myiopsitta monachus ) in Rome (central Italy): evidence for
selectivity

</td>

<td style="text-align:right;">

2017

</td>

<td style="text-align:left;">

Zoology and Ecology

</td>

<td style="text-align:left;">

10.1080/21658005.2017.1366293

</td>

<td style="text-align:left;">

<https://www.tandfonline.com/doi/full/10.1080/21658005.2017.1366293>

</td>

</tr>

<tr>

<td style="text-align:left;">

Trade and conservation implications of new beak and feather disease
virus detection in native and introduced parrots

</td>

<td style="text-align:right;">

2018

</td>

<td style="text-align:left;">

Conservation Biology

</td>

<td style="text-align:left;">

10.1111/cobi.13214

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/cobi.13214>

</td>

</tr>

<tr>

<td style="text-align:left;">

Potential distribution of alien parakeets in Tuscany (Central Italy): a
bioclimatic model approach

</td>

<td style="text-align:right;">

2014

</td>

<td style="text-align:left;">

Ethology Ecology & Evolution

</td>

<td style="text-align:left;">

10.1080/03949370.2014.895424

</td>

<td style="text-align:left;">

<http://www.tandfonline.com/doi/abs/10.1080/03949370.2014.895424>

</td>

</tr>

<tr>

<td style="text-align:left;">

Detailed monitoring of a small but recovering population reveals
sublethal effects of disease and unexpected interactions with
supplemental feeding

</td>

<td style="text-align:right;">

2015

</td>

<td style="text-align:left;">

Journal of Animal Ecology

</td>

<td style="text-align:left;">

10.1111/1365-2656.12348

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/1365-2656.12348>

</td>

</tr>

<tr>

<td style="text-align:left;">

The parakeet protectors: Understanding opposition to introduced species
management

</td>

<td style="text-align:right;">

2019

</td>

<td style="text-align:left;">

Journal of Environmental Management

</td>

<td style="text-align:left;">

10.1016/j.jenvman.2017.11.036

</td>

<td style="text-align:left;">

<https://www.sciencedirect.com/science/article/pii/S0301479717311118>

</td>

</tr>

<tr>

<td style="text-align:left;">

Deterring hooded crows from re-nesting on power poles

</td>

<td style="text-align:right;">

2012

</td>

<td style="text-align:left;">

Wildlife Society Bulletin

</td>

<td style="text-align:left;">

10.1002/wsb.211

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1002/wsb.211>

</td>

</tr>

<tr>

<td style="text-align:left;">

Long-term, fine-scale temporal patterns of genetic diversity in the
restored Mauritius parakeet reveal genetic impacts of management and
associated demographic effects on reintroduction programmes

</td>

<td style="text-align:right;">

2013

</td>

<td style="text-align:left;">

Biological Conservation

</td>

<td style="text-align:left;">

10.1016/j.biocon.2013.02.013

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/S000632071300061X>

</td>

</tr>

<tr>

<td style="text-align:left;">

Mediterranean versus Atlantic monk parakeets Myiopsitta monachus :
Towards differentiated management at the European scale

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

Pest Management Science

</td>

<td style="text-align:left;">

10.1002/ps.5320

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1002/ps.5320>

</td>

</tr>

<tr>

<td style="text-align:left;">

Unrelenting spread of the alien monk parakeet Myiopsitta monachus in
Israel. Is it time to sound the alarm?

</td>

<td style="text-align:right;">

2016

</td>

<td style="text-align:left;">

Pest Management Science

</td>

<td style="text-align:left;">

10.1002/ps.4349

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1002/ps.4349>

</td>

</tr>

<tr>

<td style="text-align:left;">

Concerns regarding the scientific evidence informing impact risk
assessment and management recommendations for invasive birds

</td>

<td style="text-align:right;">

2011

</td>

<td style="text-align:left;">

Biological Conservation

</td>

<td style="text-align:left;">

10.1016/j.biocon.2011.05.001

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/S0006320711001881>

</td>

</tr>

<tr>

<td style="text-align:left;">

Social–ecological mismatches create conservation challenges in
introduced species management

</td>

<td style="text-align:right;">

2019

</td>

<td style="text-align:left;">

Frontiers in Ecology and the Environment

</td>

<td style="text-align:left;">

10.1002/fee.2000

</td>

<td style="text-align:left;">

<https://onlinelibrary.wiley.com/doi/abs/10.1002/fee.2000>

</td>

</tr>

<tr>

<td style="text-align:left;">

Monk parakeet nest-site selection of electric utility structures in
Texas

</td>

<td style="text-align:right;">

2014

</td>

<td style="text-align:left;">

Landscape and Urban Planning

</td>

<td style="text-align:left;">

10.1016/j.landurbplan.2014.04.016

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/S0169204614001005>

</td>

</tr>

<tr>

<td style="text-align:left;">

Worldwide impact of alien parrots (Aves Psittaciformes) on native
biodiversity and environment: a review

</td>

<td style="text-align:right;">

2014

</td>

<td style="text-align:left;">

Ethology Ecology & Evolution

</td>

<td style="text-align:left;">

10.1080/03949370.2014.905981

</td>

<td style="text-align:left;">

<http://www.tandfonline.com/doi/abs/10.1080/03949370.2014.905981>

</td>

</tr>

<tr>

<td style="text-align:left;">

Interspecific interactions in nesting and feeding urban sites among
introduced Monk Parakeet ( Myiopsitta monachus ) and syntopic bird
species

</td>

<td style="text-align:right;">

2016

</td>

<td style="text-align:left;">

Ethology Ecology & Evolution

</td>

<td style="text-align:left;">

10.1080/03949370.2015.1119761

</td>

<td style="text-align:left;">

<https://www.tandfonline.com/doi/full/10.1080/03949370.2015.1119761>

</td>

</tr>

<tr>

<td style="text-align:left;">

Preliminary evidence suggests extra-pair mating in the endangered echo
parakeet, Psittacula eques

</td>

<td style="text-align:right;">

2015

</td>

<td style="text-align:left;">

African Zoology

</td>

<td style="text-align:left;">

10.1080/15627020.2009.11407440

</td>

<td style="text-align:left;">

<https://www.tandfonline.com/doi/full/10.1080/15627020.2009.11407440>

</td>

</tr>

<tr>

<td style="text-align:left;">

AFFECTIVE ETHOLOGIES

</td>

<td style="text-align:right;">

2015

</td>

<td style="text-align:left;">

Angelaki

</td>

<td style="text-align:left;">

10.1080/0969725X.2015.1065118

</td>

<td style="text-align:left;">

<https://www.tandfonline.com/doi/full/10.1080/0969725X.2015.1065118>

</td>

</tr>

<tr>

<td style="text-align:left;">

Characterization of Mauritius parakeet ( Psittacula eques )
microsatellite loci and their cross-utility in other parrots
(Psittacidae, Aves)

</td>

<td style="text-align:right;">

2009

</td>

<td style="text-align:left;">

Molecular Ecology Resources

</td>

<td style="text-align:left;">

10.1111/j.1755-0998.2009.02621.x

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/j.1755-0998.2009.02621.x>

</td>

</tr>

<tr>

<td style="text-align:left;">

Establishment success of invasive ring-necked and monk parakeets in
Europe

</td>

<td style="text-align:right;">

2009

</td>

<td style="text-align:left;">

Journal of Biogeography

</td>

<td style="text-align:left;">

10.1111/j.1365-2699.2009.02177.x

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/j.1365-2699.2009.02177.x>

</td>

</tr>

<tr>

<td style="text-align:left;">

Diazacon Inhibits Reproduction in Invasive Monk Parakeet Populations

</td>

<td style="text-align:right;">

2008

</td>

<td style="text-align:left;">

Journal of Wildlife Management

</td>

<td style="text-align:left;">

10.2193/2007-391

</td>

<td style="text-align:left;">

<http://www.bioone.org/doi/abs/10.2193/2007-391>

</td>

</tr>

<tr>

<td style="text-align:left;">

Preferences of Orange-winged Amazon parrots (Amazona amazonica) for cage
enrichment devices

</td>

<td style="text-align:right;">

2009

</td>

<td style="text-align:left;">

Applied Animal Behaviour Science

</td>

<td style="text-align:left;">

10.1016/j.applanim.2009.06.006

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/S0168159109001932>

</td>

</tr>

<tr>

<td style="text-align:left;">

Ecological rhythms and the management of humid tropical forests Examples
from the Caribbean National Forest, Puerto Rico

</td>

<td style="text-align:right;">

2001

</td>

<td style="text-align:left;">

Forest Ecology and Management

</td>

<td style="text-align:left;">

10.1016/S0378-1127(01)00515-1

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/S0378112701005151>

</td>

</tr>

<tr>

<td style="text-align:left;">

An economic assessment of the potential for predator management to
benefit Puerto Rican parrots

</td>

<td style="text-align:right;">

2003

</td>

<td style="text-align:left;">

Ecological Economics

</td>

<td style="text-align:left;">

10.1016/S0921-8009(03)00143-5

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/S0921800903001435>

</td>

</tr>

<tr>

<td style="text-align:left;">

Ground Parrots and fire in east Gippsland, Victoria: habitat occupancy
modelling from automated sound recordings

</td>

<td style="text-align:right;">

2016

</td>

<td style="text-align:left;">

Emu - Austral Ornithology

</td>

<td style="text-align:left;">

10.1071/MU16014

</td>

<td style="text-align:left;">

<https://www.tandfonline.com/doi/full/10.1071/MU16014>

</td>

</tr>

<tr>

<td style="text-align:left;">

Spatial and seasonal variation in abundance within an insular grey
parrot population

</td>

<td style="text-align:right;">

2017

</td>

<td style="text-align:left;">

African Journal of Ecology

</td>

<td style="text-align:left;">

10.1111/aje.12367

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/aje.12367>

</td>

</tr>

<tr>

<td style="text-align:left;">

Situation-dependant management of large parrots by manipulation of the
social environment

</td>

<td style="text-align:right;">

2000

</td>

<td style="text-align:left;">

International Zoo Yearbook

</td>

<td style="text-align:left;">

10.1111/j.1748-1090.2000.tb00729.x

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/j.1748-1090.2000.tb00729.x>

</td>

</tr>

<tr>

<td style="text-align:left;">

Management of the Double-eyed or Red-browed fig parrot Cyclopsitta
diophthalma macleayana at Currumbin Sanctuary, Queensland

</td>

<td style="text-align:right;">

2000

</td>

<td style="text-align:left;">

International Zoo Yearbook

</td>

<td style="text-align:left;">

10.1111/j.1748-1090.2000.tb00716.x

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1111/j.1748-1090.2000.tb00716.x>

</td>

</tr>

<tr>

<td style="text-align:left;">

The Large-Scale Removal of Mammalian Invasive Alien Species in Northern
Europe

</td>

<td style="text-align:right;">

2015

</td>

<td style="text-align:left;">

Pest Management Science

</td>

<td style="text-align:left;">

10.1002/ps.4224

</td>

<td style="text-align:left;">

<http://doi.wiley.com/10.1002/ps.4224>

</td>

</tr>

<tr>

<td style="text-align:left;">

Factors Related to Farmers’ Preferences to Decrease Monk Parakeet Damage
to Crops

</td>

<td style="text-align:right;">

2013

</td>

<td style="text-align:left;">

Human Dimensions of Wildlife

</td>

<td style="text-align:left;">

10.1080/10871209.2013.745102

</td>

<td style="text-align:left;">

<http://www.tandfonline.com/doi/abs/10.1080/10871209.2013.745102>

</td>

</tr>

<tr>

<td style="text-align:left;">

Threats from introduced birds to native birds

</td>

<td style="text-align:right;">

2014

</td>

<td style="text-align:left;">

Emu - Austral Ornithology

</td>

<td style="text-align:left;">

10.1071/MU12122

</td>

<td style="text-align:left;">

<https://www.tandfonline.com/doi/full/10.1071/MU12122>

</td>

</tr>

<tr>

<td style="text-align:left;">

General management principles and a checklist of strategies to guide
forest biodiversity conservation

</td>

<td style="text-align:right;">

2006

</td>

<td style="text-align:left;">

Biological Conservation

</td>

<td style="text-align:left;">

10.1016/j.biocon.2006.02.019

</td>

<td style="text-align:left;">

<http://www.sciencedirect.com/science/article/pii/S0006320706000814>

</td>

</tr>

<tr>

<td style="text-align:left;">

Reed warblers discriminate cuckoos from sparrowhawks with graded alarm
signals that attract mates and neighbours

</td>

<td style="text-align:right;">

2008

</td>

<td style="text-align:left;">

Animal Behaviour

</td>

<td style="text-align:left;">

10.1016/j.anbehav.2008.03.020

</td>

<td style="text-align:left;">

<https://www.sciencedirect.com/science/article/pii/S0003347208002170>

</td>

</tr>

<tr>

<td style="text-align:left;">

Foraging ‘enrichment’ as treatment for pterotillomania

</td>

<td style="text-align:right;">

2008

</td>

<td style="text-align:left;">

Applied Animal Behaviour Science

</td>

<td style="text-align:left;">

10.1016/j.applanim.2007.05.015

</td>

<td style="text-align:left;">

<https://www.sciencedirect.com/science/article/pii/S0168159107001669>

</td>

</tr>

</tbody>

</table>

<!-- Distribution of  records among unique publishers. -->

Distribution across publications:
![](README_files/figure-gfm/topjrnls2-1.png)<!-- -->

## Results Files

Overviews of the results can be found in the [results](/results) folder
in this
repository.

### Total records per publication

| pubname                                                                                                                           | count |
| :-------------------------------------------------------------------------------------------------------------------------------- | ----: |
| African Journal of Ecology                                                                                                        |     2 |
| African Zoology                                                                                                                   |     2 |
| Angelaki                                                                                                                          |     2 |
| Animal Behaviour                                                                                                                  |     1 |
| Applied Animal Behaviour Science                                                                                                  |     3 |
| Australian Veterinary Journal                                                                                                     |     2 |
| Avian Pathology                                                                                                                   |     1 |
| Biological Conservation                                                                                                           |     6 |
| Conservation Biology                                                                                                              |     2 |
| Ecological Economics                                                                                                              |     3 |
| Ecological Monographs                                                                                                             |     1 |
| Emu - Austral Ornithology                                                                                                         |     4 |
| Environment Concerns in Rights-of-Way Management 8th International Symposium 12–16 September 2004 Saratoga Springs, New York, USA |     1 |
| Environmental Research                                                                                                            |     1 |
| Ethology Ecology & Evolution                                                                                                      |     6 |
| Fisheries Management and Ecology                                                                                                  |     1 |
| Forest Ecology and Management                                                                                                     |     2 |
| Frontiers in Ecology and the Environment                                                                                          |     2 |
| Human Dimensions of Wildlife                                                                                                      |     1 |
| International Zoo Yearbook                                                                                                        |     4 |
| Journal of Animal Ecology                                                                                                         |     2 |
| Journal of Biogeography                                                                                                           |     2 |
| Journal of Environmental Management                                                                                               |     5 |
| Journal of Field Ornithology                                                                                                      |     1 |
| Journal of Location Based Services                                                                                                |     1 |
| Journal of Unmanned Vehicle Systems                                                                                               |     1 |
| Journal of Wildlife Management                                                                                                    |     2 |
| Landscape and Urban Planning                                                                                                      |     2 |
| Molecular Ecology Resources                                                                                                       |     2 |
| Pest Management Science                                                                                                           |     7 |
| Plant Biosystems - An International Journal Dealing with all Aspects of Plant Biology                                             |     1 |
| Security and Privacy                                                                                                              |     1 |
| The Journal of Comparative Neurology                                                                                              |     1 |
| Wildlife Society Bulletin                                                                                                         |     2 |
| Zoo Biology                                                                                                                       |     1 |
| Zoology and Ecology                                                                                                               |     2 |

## More Information

### This project relies on the UW Deepdive Infrastructure

[See the UW deepdive
infrastructure](UW-Deepdive-Infrastructure/app-template) for more
details. Check out [the
wiki](https://github.com/UW-Deepdive-Infrastructure/app-template/wiki)
for more information on getting started.

### Disclaimer

This software is preliminary or provisional and is subject to revision.
It is being provided to meet the need for timely best science. The
software has not received final approval by the U.S. Geological Survey
(USGS). No warranty, expressed or implied, is made by the USGS or the
U.S. Government as to the functionality of the software and related
material nor shall the fact of release constitute any such warranty. The
software is provided on the condition that neither the USGS nor the U.S.
Government shall be held liable for any damages resulting from the
authorized or unauthorized use of the software.
