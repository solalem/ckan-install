# ckan-install

This repository contains scripts and other artifacts neccessary for installing CKAN from package on Ubuntu. The installation process follows instructions described in the official documentation at https://docs.ckan.org/en/2.9/maintaining/installing/install-from-package.html.

# Requirements

- Ubuntu 20.04
- CKAN 2.9
- Pyton 3
- Jetty9

# Installation

Clone this repo into directory of your choice

``` git clone https://github.com/solalem/ckan-install.git ```

Open ckan-install directory 

``` cd ckan-install ```

Prepare installation file with proper permissions

``` chmod +x ckan-install.sh ```

Run the installation file

``` ckan-install.sh ```

## Notes

You will be prompted to enter inputs such as passwords during the installation process. Remember these inputs since you are required to include them in configuration files. Read the Note sections in the scripts for more. 

