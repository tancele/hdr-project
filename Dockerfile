FROM tensorflow/tensorflow:1.10.1-devel-py3




# Install Python Packages & Requirements (Done near end to avoid invalidating cache)
RUN pip install --upgrade pip
COPY requirements-dev.txt requirements.txt
RUN pip install -r requirements.txt


RUN mkdir /workdir
WORKDIR /workdir


# Expose Jupyter port & cmd
EXPOSE 8888
CMD jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/workdir --allow-root --NotebookApp.token='' --NotebookApp.password=''