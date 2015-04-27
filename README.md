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

Then, when starting your saltpad container, you will want to bind ports `443`
from the saltpad container to a host external port.
The saltpad container will read its configuration from the
`/root/saltpad/saltpad/local_settings.py` file, so make sure this file is
available to docker as a volume.
You must also provide the `server.key` and `server.crt`ssl files in the
`/etc/pki/tls/certs` volume.

For example:

    $ docker pull bbinet/saltpad

    $ docker run --name saltpad \
        -v /home/saltpad/local_settings.py:/root/saltpad/saltpad/local_settings.py:ro \
        -v /home/saltpad/certs:/etc/pki/tls/certs:ro \
        --link salt-master:salt-master
        -p 443:443 \
        bbinet/saltpad
