#!/bin/bash

# use the tensorflow sif from local install
module load ngc-tensorflow

/bin/cp -f $TFSIF .

# if there isn't one already, pull the image:
# apptainer pull docker://nvcr.io/nvidia/tensorflow:25.02-tf2-py3
