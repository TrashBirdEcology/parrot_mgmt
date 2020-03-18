Using GeoDeepDive (xDD) to Ping the White and Grey Literature for Parrot
Management
================
Last updated: 2020-03-17

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

### Step 1: Open the notebook

Open the Jupyter notebook in your web browser by doing the following: 1.
Open terminal (Mac) or Command Line (Windows, Linux) 2. Navigate to this
directory (`cd ~/path/to/parrot_xdd/`) 3. Open the .ipynb (type:
`jupyter notebook`). This opens the notebook directory in your web
browser. 4. Navigate to (i.e. click) the file `parrot_xDD.ipynb`: this
will open the notebook and a Kernel. 5. Edit the terms (keywords, search
phrases). Edit the code chunk containing terms - See section: `Set a
term or loop through terms`  
\- `terms = [...]` 6. Save the notebook (it typically autosaves but just
to be safe). Ctrl+S (MS) or Cmd+S (Mac) or \>File\>Save and Checkpoint
7. Execute the notebook (Run or \>Kernel\>Restart and Run All) 8.
Navigate to the results
(~/xdd\_json/).

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

Note that the following files, associated with search terms, did not
yield any results:
/Users/jburnett/Documents/GitHub/parrot\_mgmt/xdd\_json/management of
parrot.txt,
/Users/jburnett/Documents/GitHub/parrot\_mgmt/xdd\_json/parrot
control.txt,
/Users/jburnett/Documents/GitHub/parrot\_mgmt/xdd\_json/parrot
management.txt

## Import and munge the xdd json into an R df

``` r
parrot_xdd <- get_xdd_df(files[keep])
```

## Overview of parrot records retrieved from the GeoDeepDive database.

We have used various search terms to identify potential works of
relevance to parrot management. Here we found only **17** unique
publications which used our terms (see ~/parrot\_xDD.ipynb).

| Exact search phrase      | Number of unique records in xDD/GDD |
| ------------------------ | ----------------------------------- |
| "management of parrot\*" | 7                                   |
| “parrot control”         | 3                                   |
| “parrot management”      | 7                                   |

![](README_files/figure-gfm/pubsvtime-1.png)<!-- -->

When we remove the redundancies in the records returned using the
abovementioned searches,17 remain.

We can visualize the distribution of records among unique publishers.
Few publications contain the bulk of the records.
![](README_files/figure-gfm/topjrnls-1.png)<!-- -->

Distribution across publications:
![](README_files/figure-gfm/topjrnls2-1.png)<!-- -->

## Results Files

Overviews of the results can be found in the [results](/results) folder
in this repository.

### Total records per publication

Here is a comprehensive list of all publications with relevant terms
(except “BBL”):

| pubname                          | count |
| :------------------------------- | ----: |
| African Journal of Ecology       |     1 |
| Animal Behaviour                 |     1 |
| Applied Animal Behaviour Science |     2 |
| Avian Pathology                  |     1 |
| Biological Conservation          |     1 |
| Ecological Economics             |     2 |
| Ecological Monographs            |     1 |
| Emu - Austral Ornithology        |     1 |
| Fisheries Management and Ecology |     1 |
| Forest Ecology and Management    |     1 |
| International Zoo Yearbook       |     2 |
| Journal of Field Ornithology     |     1 |
| Security and Privacy             |     1 |
| Zoo Biology                      |     1 |

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
