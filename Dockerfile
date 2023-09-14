FROM python:3.8.8
USER root

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip install opencv-python
RUN apt install htop screen -y
RUN git clone https://github.com/rgerum/cameratransform.git /software/cameratransform
RUN cd /software/cameratransform; git reset --hard 64a0425
RUN pip install -e /software/cameratransform
RUN git clone https://github.com/fabrylab/clickpoints.git /software/clickpoints
RUN cd /software/clickpoints; git reset --hard 51ad5fd
RUN pip install -e /software/clickpoints

RUN pip install jupyter
RUN pip install jupyterlab
RUN pip install openpyxl tables
RUN pip install pymc3

RUN mkdir /work && mkdir Supplement && cd work
COPY ./Supplement /work/Supplement
COPY ./*.ipynb /work
CMD bash -c "cd /work; /usr/local/bin/python /usr/local/bin/jupyter-notebook --ip 0.0.0.0 --no-browser --allow-root --port ${JUPYTERPORT} --config=/root/.jupyter/jupyter_notebook_config.json"
