FROM continuumio/miniconda3:25.3.1-1

ENV PATH=/opt/conda/bin:$PATH

RUN conda config --append channels bioconda && \
	conda config --append channels conda-forge && \
	conda config --append channels anaconda && \
	conda install -c bioconda vsearch=2.30.0 && \
	conda clean -a -y

CMD ["vsearch"]
