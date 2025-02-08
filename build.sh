#!/bin/bash

# Install Python and pip
apt-get update && apt-get install -y python3 python3-pip

# Install MkDocs and Material theme
pip3 install mkdocs mkdocs-material

# Build the MkDocs site
mkdocs build
