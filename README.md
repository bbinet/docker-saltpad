docker-saltpad
==============

Docker container for SaltPad:
http://saltpad.readthedocs.org/en/latest/

Build
-----

To create the image `bbinet/saltpad`, execute the following command in the
`docker-saltpad` folder:

    docker build -t bbinet/saltpad .

You can now push the new image to the public registry:
    
    docker push bbinet/saltpad


Run
---

Then, when starting your saltpad container, you will want to bind ports `80`
from the saltpad container to a host external port.
The saltpad container will read its configuration from the
`/root/saltpad/saltpad/local_settings.py` file, so make sure this file is
available to docker as a volume.

For example:

    $ docker pull bbinet/saltpad

    $ docker run --name saltpad \
        -v /home/saltpad/local_settings.py:/root/saltpad/saltpad/local_settings.py:ro \
        -p 80:80 \
        bbinet/saltpad
