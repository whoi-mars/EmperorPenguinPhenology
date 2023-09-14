# EmperorPenguinPhenology

The software and data repository containing the documentation of the publication "Remote sensing of emperor penguin abundance and breeding success".
Data is stored in excel files in the folder "Supplement".
The whole implementation and documentation to reproduce the analysis is stored in the jupyter notebook "EmperorPenguinPhenology.ipynb"
The jupyter notebook can be viewed within github and shows the outputs as off our evaluation on our hardware.

# System Requirements
## Hardware requirements
The software does not require any non standard hardware. Enough RAM needs to be provided for in-memory operatinos. The multi-chain sampling works fastest on a system with at least 6 cores.

## Software Requirements
### Operating system
The software was tested on Ubuntu 20.04.3

# Installation Guide (docker, Linux)
- Install [docker](https://docs.docker.com/install/)
- Download this repo from github `git clone https://github.com/AlexanderWinterl/EmperorPenguinPhenology.git`
- Build the docker image (epp = EmperorPenguinPhenology) `docker build --tag epp .`
  - This takes typically 5 minutes to buid
- Launch the container `docker run -it --rm --net host -e JUPYTERPORT=9876 --name epp epp:latest`
- The launch command will generate an URL where the jupyter notebook is hosted. A token for logging in is provided in the URL as well.
# Running the notebook
The notebook is self-explanatory. The notebook cells, where bayesian sampling occurs will tipycally take several minutes up to an hour to finish (depending on the number of samples.
