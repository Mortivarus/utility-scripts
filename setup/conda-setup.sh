#!/bin/bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/conda
$HOME/conda/bin/conda init
rm Miniconda3-latest-Linux-x86_64.sh 
