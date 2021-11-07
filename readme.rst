Rithm Setup
===========

An experimental attempt at making a Docker container for the Rithm student setup.

To try out::

  make build    # need to do only if Dockerfile changed
  make create   # need to do once to make container
  make start    # starts container and drops you into it

The setup::

  username: user
  password: password

Ports 5000, 3000 and 3001 are forwarded from the container to the host.

