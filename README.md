Analysis Notebooks
==================

This repository contains the notebooks used to create the analyses in
Vazquez-Baeza et. al. 20XX. Each notebook tries to summarize a particular step
and be as standalone as possible. In this document we briefly describe each of
the analyses needed for the paper and when possible we group them together, so
as to provide more cohesion.

**Note**: this notebook does not provide **all** the data files used, as the
size would exceed the limits allowed in GitHub. However, we provide the
main data files (metadata and OTU tables), from which the rest of the data
can be generated using these commands.

-----------------------

## Metadata

The metadata processing required two steps, one for cleanup of the data and
another one to prepare the data for [Qiita](https://qiita.microbio.me).

**1-metadata**: the metadata is cleaned up and filtered to remove samples
that we didn't use in the rest of the analyses. We also calculate the dysbiosis
index as defined in [Gevers et. al.
2014](http://www.ncbi.nlm.nih.gov/pubmed/24629344).

**1.1-metadata-for-qiita**: adds the needed fields and columns to the
mapping file, and creates a sample and prep template that were used to upload
the data into the [Qiita study](https://qiita.ucsd.edu/study/description/833).


## Alpha diversity

**2-alpha-diversity**: this notebook includes the following alpha diversity
comparisons: fat, protein, age, weight and disease state. As well as a comparison
of the human-trained dysbiosis index and alpha diversity. Of note, we did this
comparisons for several metrics, but only used Faith's phylogenetic diversity
in the manuscript.

## Beta diversity

**3-beta-diversity**: this notebook includes the creation of the beta diversity
plots for the dog dataset only. Biplots and statistics to assess clustering
significance are also performed as part of this notebook.

## Group significane

**4-group-significance**: this notebook tests statistical significance between
the disease affected and unaffected dogs, and plots their relative abundance as
a heatmap. While none of the plots shown in this notebook were used in this
paper, it helped guide our analysis for the next few notebooks.

## Dysbiosis index

**5-md-index**: in this notebook we explored the behaviour of some of the taxa
associated with the human-trained dysbiosis index, however we weren't able to 
find much information.

## New dysbiosis index

After realizing that the human-trained dysbiosis index didn't perform as well
in dogs, we decided to use CCREPE to train a new dysbiosis index using the dog
data alone. In **6-md-index-ccrepe** we calculate the checkerboard scores and
asscociated significance tables. These results are used in
**6.1-md-index-ccrepe-visualizations**, where we visualize them in a variety of
ways, ultimately resolving that we should use Cytoscape to do that. The final
section of this notebook shows the plots relating alpha diversity and the
index.

## Classification accuracy

The ROC curves and feature importance scores are created in **7-classifier**
and **7.1-classifier-feature-importance** (respectively). Here we use R and
[hack_ml](https://github.com/rnaer/hack_ml) to create the plots and tables.

## Human vs Dog comparison

In **8-comparison** we explore the combined data and perform a few comparisons
that were ultimately not used in the paper. **8.1-comparison** is concerned
with making the data between humans and dogs as comparable as possible.

## PICRUSt

PICRUSt processing was processed at the [galaxy
server](https://huttenhower.sph.harvard.edu/galaxy/). In **9-picrust** we
compare the combined human and dog samples, and in **9.1-picrust** we use the
NSTI (nearest sequenced taxon index) to assess the quality of our predictions.

## Comparison with Minamoto et al 2015

In this notebook we use the dog-trained dysbiosis index in a different dataset,
that was processed mainly in a separate supercomputer.

---------------------

List of Python dependencies that were not explicitly noted in the notebooks:

```
alabaster==0.7.4
appnope==0.1.0
Babel==1.3
backports-abc==0.4
backports.ssl-match-hostname==3.5.0.1
biom-format==2.1.4
burrito==0.9.1
burrito-fillings==0.1.1
certifi==2016.2.28
cogent==1.5.3
Cython==0.22
decorator==4.0.9
docutils==0.12
emperor==0.9.51.dev0
functools32==3.2.3.post2
future==0.14.3
gdata==2.0.18
gnureadline==6.3.3
h5py==2.5.0
igraph==0.1.8
ipykernel==4.3.1
ipython==4.1.2
ipython-genutils==0.1.0
ipywidgets==4.1.1
Jinja2==2.8
jsonschema==2.5.1
jupyter==1.0.0
jupyter-client==4.2.2
jupyter-console==4.1.1
jupyter-core==4.1.0
MarkupSafe==0.23
matplotlib==1.4.3
mistune==0.7.2
mock==1.0.1
natsort==3.5.6
nbconvert==4.1.0
nbformat==4.0.1
networkx==1.10
nose==1.3.7
notebook==4.1.0
numpy==1.10.4
numpydoc==0.5
pandas==0.17.1
path.py==8.1.2
patsy==0.4.0
pexpect==4.0.1
pickleshare==0.6
ptyprocess==0.5.1
Pygments==2.1.3
pynast==1.2.2
pyparsing==2.0.3
pyqi==0.3.2
python-dateutil==2.4.2
pytz==2015.7
pyzmq==15.2.0
qcli==0.1.1
qiime==1.9.1
qiime-default-reference==0.1.2
qtconsole==4.2.1
requests==2.7.0
rpy2==2.7.4
scikit-bio==0.2.3
scipy==0.15.1
seaborn==0.6.0
simplegeneric==0.8.1
singledispatch==3.4.0.3
six==1.10.0
snowballstemmer==1.2.0
Sphinx==1.3.1
sphinx-rtd-theme==0.1.8
statsmodels==0.6.1
terminado==0.6
tornado==4.3
traitlets==4.2.1
xlrd==0.9.4
```
