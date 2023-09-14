FROM pymc/pymc3:version-3.11.2
USER root

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip install opencv-python
RUN apt install htop screen -y
RUN git clone https://github.com/rgerum/cameratransform.git /software/cameratransform
RUN pip install -e /software/cameratransform
RUN git clone https://github.com/fabrylab/clickpoints.git /software/clickpoints
RUN pip install -e /software/clickpoints


RUN pip install jupyter
RUN pip install jupyterlab
RUN pip install openpyxl tables
RUN git clone https://github.com/pymc-devs/pymc /software/pymc3 && \
cd /software/pymc3/ && \
git checkout v3 && \
pip install -r requirements.txt
RUN conda install mkl-service
RUN apt install -y libblas-dev
CMD bash -c "/opt/conda/bin/python3.8 /opt/conda/bin/jupyter-notebook --ip 0.0.0.0 --no-browser --allow-root --port ${JUPYTERPORT} --config=/root/.jupyter/jupyter_notebook_config.json"
