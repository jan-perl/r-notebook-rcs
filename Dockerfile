FROM jupyter/r-notebook:latest

USER root


RUN apt-get update && apt-get install -y --no-install-recommends \
	rcs subversion
RUN pip install jupytext --upgrade
RUN jupyter notebook --generate-config -y

COPY addl_config.py /
RUN cat /addl_config.py >> ~/.jupyter/jupyter_notebook_config.py
RUN cat ~/.jupyter/jupyter_notebook_config.py

USER $NB_USER

RUN conda install -v -y -c conda-forge r-openxlsx r-ggplot2


