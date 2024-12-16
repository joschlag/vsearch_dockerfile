FROM continuumio/miniconda:4.7.10

ENV PATH /opt/conda/bin:$PATH

RUN conda config --append channels bioconda && \
	conda config --append channels conda-forge && \
	conda config --append channels anaconda && \
	conda install -c bioconda vsearch=2.29.1 && \
	conda clean -a -y

CMD ["vsearch"]
