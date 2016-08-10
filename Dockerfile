# based on https://github.com/ctb/2016-mybinder-irkernel
FROM andrewosh/binder-base

USER root

COPY install-irkernel.R /home/install-irkernel.R

USER main

RUN conda install python=2.7 numpy scipy matplotlib seaborn pandas h5py pip jupyter statsmodels cython patsy networkx=1.10 --yes

RUN conda install -c r r --yes
RUN conda install -c r rpy2 --yes
RUN conda install -c r r-rzmq --yes

RUN pip install qiime

RUN conda install -c r r-irkernel --yes


USER main
