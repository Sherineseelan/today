FROM python:3.7
WORKDIR /tool
COPY . /tool
RUN apt-get update && \
    mkdir /tools && \
    cd /tools/ && \
    apt-get install -y pip && \
    pip install flask && \
    python -c "import flask; print(flask.__version__)" && \
    pip install virtualenv uwsgi && \
    virtualenv venv && \
    . ./venv/bin/activate && \
    apt-get install -y gcc python3-dev && \  
    pip install --upgrade wheel pip setuptools 
EXPOSE 80
CMD ["uwsgi", "--ini", "app.ini"]
