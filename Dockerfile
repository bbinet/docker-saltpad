FROM debian:wheezy

MAINTAINER Bruno Binet <bruno.binet@helioslite.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends python-pip git
RUN git clone git@github.com:tinyclues/saltpad.git /root/saltpad
RUN pip install waitress jinja2 flask flask-wtf requests werkzeug
# pymongo wheel==0.22.0
ENV PYTHONPATH /root/saltpad

VOLUME ["/root/saltpad/saltpad/local_settings.py"]

EXPOSE 80

CMD ["waitress-serve", "--host=0.0.0.0", "--port=80", "saltpad:app"]
