FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7
RUN apk --update add bash nano
ENV STATIC_URL /static
ENV STATIC_PATH /var/www/app/static
COPY ./requirements.txt /var/www/requirements.txt

RUN apt-get update && apt-get install -y \
    python3-pip
RUN \ 
    pip3 install --no-cache-dir Cython
RUN \
    cd lib && \
    python3 setup.py
RUN python3 -c "import Cython; print(Cython.__version__)"

RUN pip install -r /var/www/requirements.txt
