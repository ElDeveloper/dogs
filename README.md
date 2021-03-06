Analysis Notebooks
==================

This repository contains the notebooks used to create the analyses in
[Vazquez-Baeza et al. 2016](http://www.nature.com/articles/nmicrobiol2016177).
Each notebook tries to summarize a particular step and be as standalone as
possible. In this document we briefly describe each of the analyses needed for
the paper and when possible we group them together, so as to provide more
cohesion.

#### Important notes for the reader

- This repository does not provide **all** the data files used, as the size
  would exceed the limits allowed in GitHub. However, we provide the main data
  files (metadata and OTU tables), from which the rest of the data can be
  generated using these commands. The rest of the sequence data can be freely
  accessed through Qiita (remember to log in) in [study
  833](https://qiita.ucsd.edu/study/description/833).

- In several locations in the notebooks, there are cells that reference a
  remote address (i.e. in `ssh` or `scp` commands), you don't need to execute
  these commands, the files being fetched should already be provided in this
  repository.

-----------------------

## Metadata

The metadata processing required two steps, one for cleanup of the data and
another one to prepare the data for [Qiita](https://qiita.microbio.me).

[**1-metadata**](notebooks/01-metadata.ipynb): the metadata is cleaned up and
filtered to remove samples that we didn't use in the rest of the analyses. We
also calculate the dysbiosis index as defined in [Gevers et. al.
2014](http://www.ncbi.nlm.nih.gov/pubmed/24629344).

[**1.1-metadata-for-qiita**](notebooks/01.1-metadata-for-qiita.ipynb): adds the
needed fields and columns to the mapping file, and creates a sample and prep
template that were used to upload the data into the [Qiita
study](https://qiita.ucsd.edu/study/description/833).


## Alpha diversity

[**2-alpha-diversity**](notebooks/02-alpha-diversity.ipynb): this notebook includes the following alpha diversity
comparisons: fat, protein, age, weight and disease state. As well as a comparison
of the human-trained dysbiosis index and alpha diversity. Of note, we did this
comparisons for several metrics, but only used Faith's phylogenetic diversity
in the manuscript.

## Beta diversity

[**3-beta-diversity**](notebooks/03-beta-diversity.ipynb): this notebook
includes the creation of the beta diversity plots for the dog dataset only.
Biplots and statistics to assess clustering significance are also performed as
part of this notebook.
[**3.1-beta-diversity-antibiotics.ipynb**](notebooks/03.1-beta-diversity-antibiotics.ipynb):
compares the differences between samples according to their history fo
antibiotic usage.

## Group significane

[**4-group-significance**](notebooks/04-group-significance.ipynb): this notebook
tests statistical significance between the disease affected and unaffected
dogs, and plots their relative abundance as a heatmap. While none of the plots
shown in this notebook were used in this paper, it helped guide our analysis
for the next few notebooks.

## Feature exploration

[**5-feature-exploration**](notebooks/05-feature-exploration.ipynb): this
notebook looks at a few different ways to filter out the data so as to avoid
OTUs that are not well represented througout the samples.

## New dysbiosis index

After realizing that the human-trained dysbiosis index didn't perform as well
in dogs, we decided to use CCREPE to train a new dysbiosis index using the dog
data alone. In [**6-md-index-ccrepe**](notebooks/06-md-index-ccrepe.ipynb) we
calculate the checkerboard scores and asscociated significance tables. These
results are used in
[**6.1-md-index-ccrepe-visualizations**](notebooks/06.1-md-index-ccrepe-visualizations.ipynb),
where we visualize them in a variety of ways, ultimately resolving that we
should use Cytoscape to do that. The final section of this notebook shows the
plots relating alpha diversity and the index.

## Classification accuracy

The ROC curves and feature importance scores are created in
[**7-classifier**](notebooks/07-classifier.ipynb) and
[**7.1-classifier-feature-importance**](notebooks/07.1-classifier-feature-importance.ipynb)
(respectively). Here we use R and [hack_ml](https://github.com/rnaer/hack_ml)
to create the plots and tables.

## Human vs Dog comparison

In [**8-comparison**](notebooks/08-comparison.ipynb) we explore the combined
data and perform a few comparisons that were ultimately not used in the paper.
[**8.1-comparison**](notebooks/08.1-comparison.ipynb) is concerned with making
the data between humans and dogs as comparable as possible.

## PICRUSt

PICRUSt predictions were generated at the [galaxy
server](https://huttenhower.sph.harvard.edu/galaxy/). In
[**9-picrust**](notebooks/09-picrust.ipynb) we compare the combined human and
dog samples, and in [**9.1-picrust-nsti**](notebooks/09.1-picrust-nsti.ipynb) we
use the NSTI (nearest sequenced taxon index) to assess the quality of our
predictions.

## Comparison with Minamoto et al 2015

In [**10-minamoto-md-index**](notebooks/10-minamoto-md-index.ipynb) notebook we
use the dog-trained dysbiosis index in a different dataset, that was processed
mainly in a separate supercomputer.

## Read counts

In [**11-sequence-counts**](notebooks/11-sequence-counts.ipynb), we explore the
number of sequences that were assigned to an OTU per sample. Specifically we
compare the differences betwee closed and open reference protocols.

---------------------

[This Dockerfile](Dockerfile) should install any additional dependencies for
these notebooks to work.
