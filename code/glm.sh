#!/bin/bash

tar -xzf R361.tar.gz

export PATH=$PWD/R/bin:$PATH

export RHOME=$PWD/R

export R_LIBS=$PWD/packages

tar -xvf $1.tar

Rscript glm.R $1
