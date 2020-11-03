FROM jupyter/datascience-notebook
COPY code /home/{USER}/work/presets
RUN pip3 install /home/{USER}/work/presets/lib/
