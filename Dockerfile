FROM jupyter/r-notebook:ubuntu-18.04
#older versions do not run on older ubuntu
#problems mainly with mamba

USER root

#from https://stackoverflow.com/questions/71941032/why-i-cannot-run-apt-update-inside-a-fresh-ubuntu22-04
RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' \
      /etc/apt/apt.conf.d/docker-clean

RUN apt-get update  && apt-get install -y --no-install-recommends \
 rcs subversion vim

#RUN mamba --version
#RUN mamba init

#RUN mkdir /home/jovyan/.cache/pip
#RUN pip install jupytext --upgrade

RUN ulimit -a
RUN conda install --yes jupytext=1.5.0
#this jupytext version does not require toml


RUN conda install --yes \
	    'r-openxlsx' \
	    'r-ggplot2'

USER $NB_USER

RUN jupyter notebook --generate-config -y

COPY jupytext.toml /
COPY addl_config.py /
COPY commit-ch.sh /
RUN cp /commit-ch.sh ~/.jupyter
RUN chmod +x ~/.jupyter/commit-ch.sh 
RUN cp /jupytext.toml ~
RUN cat /addl_config.py >> ~/.jupyter/jupyter_notebook_config.py
RUN cat ~/.jupyter/jupyter_notebook_config.py

#trial code for older versions
#RUN jupyter labextension install jupyterlab-jupytext@1.2.2 

#RUN wget https://raw.githubusercontent.com/mwouts/jupytext/main/binder/labconfig/default_setting_overrides.json -P  ~/.jupyter/labconfig/

