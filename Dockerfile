FROM debian:wheezy

MAINTAINER Bruno Binet <bruno.binet@helioslite.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends python-pip \
    git ca-certificates
RUN pip install futures gunicorn jinja2 flask flask-wtf requests werkzeug

RUN git clone https://github.com/tinyclues/saltpad.git /root/saltpad
ENV PYTHONPATH /root/saltpad
ENV SALTPAD_VERSION a66449b38c816ae3a35e1e61d06ce550fa7d51eb
RUN git reset --hard -C /root/saltpad ${SALTPAD_VERSION}

VOLUME ["/root/saltpad/saltpad/local_settings.py"]

EXPOSE 80

CMD ["gunicorn", "--bind=0.0.0.0:80", "--threads=2", "--chdir=/root/saltpad/saltpad", "saltpad.app:app"]
