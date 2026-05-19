# Trajactory and velocity analysis

This session is handled by [Zhisong He](https://zhisonghe.wixsite.com/home/)

This session will cover the following topics:
* Trajectory analysis
* Pseudotime analysis
* Fate probability estimation
* RNA velocity analysis

It will include the theoretical session, which will be in the morning, and the practical session, which will be largely in the afternoon. For the practical session, it will needs both R and Python. For that, it is recommended to use `miniconda` or `anaconda` to set up a conda environment. For Windows user, it is recommended to install a WSL (Windows Subsystem for Linux), as it has much better conda and pip support than Windows. Alternative ways are also available, for example, to use Google Colab.

## Table of Content
* [Set up a local conda environment](#set-up-a-local-conda-environment)
* [Google Colab](#google-colab)
* [Example dataset](#example-dataset)
* [Jupyter notebook vignette](#jupyter-notebook-vignette)
* [Slides](#slides)
* [More vignettes](#more-vignettes)

## Set up a local conda environment
One suggested way to set up the environment is locally via `conda` to create one conda environment with Python, and then set up the Python environment with `pip` given the package requirement declared in the `requirements.txt`.

Here is a guideline to set up the conda environment. At terminal, do the following:
```
conda create -n env_embo_pseudotime python=3.11
conda activate env_embo_pseudotime
```

### Install the Python packages with pip

A pinned `requirements.txt` is included in this repository. To reproduce the exact environment, one should clone the repo and then use the `requirements.txt` file to run `pip`:
```
git clone https://github.com/GIMM-BioCode/2026_Pipette2Code.git
cd 2026_Pipette2Code/02_Trajectories_ZHe
pip install -r requirements.txt
```

### Install pyURD (additional dependency)

The last section of the notebook uses [pyURD](https://github.com/zhisonghe/pyurd), a Python re-implementation of the URD trajectory-inference algorithm. pyURD is under active development and is not yet available on PyPI. Install it directly from GitHub:
```
pip install git+https://github.com/zhisonghe/pyurd.git
```

For this session, Jupyter Lab is a preferred IDE for this practical session. However, feel free to use any other options (e.g. PyCharm for Python, VSCode).


## Google Colab
For the Python part, you can also use Google Colab (https://colab.research.google.com/). Once a new notebook is started, you can firstly clone this GitHub repo:
```
!git clone https://github.com/GIMM-BioCode/2026_Pipette2Code.git
```
Next, install the required Python packages with `pip`. Use the Colab-specific requirements file to avoid conflicts with Colab's built-in Jupyter infrastructure:
```
!pip install -q -r 2026_Pipette2Code/02_Trajectories_ZHe/requirements-colab.txt
```
Then **restart the runtime** before running any cells (Runtime → Restart runtime).

> **Note:** Do not use `requirements.txt` in Colab — it pins Jupyter packages (`ipykernel`, `ipython`, `tornado`, etc.) that conflict with Colab's runtime and can cause the kernel to crash.

To also run the pyURD section, install it after the above (pyURD is not on PyPI):
```
!pip install -q git+https://github.com/zhisonghe/pyurd.git
```
Then restart the runtime again before running the notebook.

You can also download a file to the virtual machine so that you can load it into the session. For example:
```
!mkdir 2026_Pipette2Code/02_Trajectories_ZHe/data
!wget -q -O '2026_Pipette2Code/02_Trajectories_ZHe/data/DS1.h5ad' 'https://polybox.ethz.ch/index.php/s/GCZzdxkMiTp5ZQH/download/DS1.h5ad'
!wget -q -O '2026_Pipette2Code/02_Trajectories_ZHe/data/DS1_raw.h5ad' 'https://polybox.ethz.ch/index.php/s/GeXSaepAk9fjQqk/download/DS1_raw.h5ad'
```
You can also mount your Google Drive at the Colab notebook, in order to access your files there or to place the downloaded/saved file there:
```
from google.colab import drive
drive.mount('/content/drive')
```
*P.S.* Please make sure all the requested permission are granted. Otherwise the mounting will be failed.

## Example dataset
The example dataset used in the practical session is one 10x scRNA-seq experiment included in the following publication: [Organoid single-cell genomic atlas uncovers human-specific features of brain development](https://www.nature.com/articles/s41586-019-1654-9).

The example dataset is available as h5ad files (DS1.h5ad: [link](https://polybox.ethz.ch/index.php/s/GCZzdxkMiTp5ZQH), DS1_raw.h5ad: [link](https://polybox.ethz.ch/index.php/s/GeXSaepAk9fjQqk)) which can be loaded directly to Python.
* `DS1.h5ad` contains only the shared features in the standard Cell Ranger output, the spliced transcript count matrix as well as the unspliced count matrix. The X matrix is the log-normalized count matrix. In its `layers` slot, there are `counts`, `spliced` and `unspliced` count matrices, with the latter two critical for running scVelo.
* `DS1_raw.h5ad` contains all features in the standard Cell Ranger output. The X matrix is raw count matrix. Full metadata is included, but no other analysis results is yet included.

## Jupyter notebook vignette
In this repository there are Jupyter notebook vignettes in the `vignettes` folder, which include the codes for the practical session:
* [Tutorial.ipynb](https://github.com/GIMM-BioCode/2026_Pipette2Code/blob/main/02_Trajectories_ZHe/vignettes/Tutorial.ipynb): Jupyter notebook vignette with both codes and output;
* [Tutorial_cleared.ipynb](https://github.com/GIMM-BioCode/2026_Pipette2Code/blob/main/02_Trajectories_ZHe/vignettes/Tutorial_cleared.ipynb): Jupyter notebook vignette with only codes (recommended to start with).

The notebooks also includes a Google Colab setup cell. Executing the cell should automatically set up the right environment for Google Colab.

## Slides
The slides of the presentations are provided in the `slides` folder:
* [pseudotime_velocity_theory.pdf](https://github.com/GIMM-BioCode/2026_Pipette2Code/blob/main/02_Trajectories_ZHe/slides/pseudotime_velocity_theory.pdf): Theory session
* [pseudotime_velocity_practical.pdf](https://github.com/GIMM-BioCode/2026_Pipette2Code/blob/main/02_Trajectories_ZHe/slides/pseudotime_velocity_practical.pdf): Practical session

***Note*** Further updates to the slides may still be made

## More vignettes:
There are more vignettes available in Github for scRNA-seq data analysis:
* [Tutorial of scRNA-seq data analysis in R](https://github.com/quadbio/scRNAseq_analysis_vignette/blob/master/Tutorial.md)
* [Tutorial of scRNA-seq data analysis in Python](https://github.com/quadbio/scRNAseq_analysis_python_vignette/blob/main/Tutorial.md)
* [Tutorial of condition comparison analysis of scRNA-seq data](https://github.com/quadbio/scRNAseq_comparison_vignette/blob/master/Tutorial.md)
* [Tutorial of single-cell RNA-ATAC multiomic sequencing data analysis in R](https://github.com/quadbio/scMultiome_analysis_vignette/blob/main/Tutorial.md)
* [Tutorial of single-cell RNA-ATAC multiomic sequencing data analysis in Python](https://github.com/quadbio/scMultiome_analysis_python_vignette/blob/main/Tutorial.md)
