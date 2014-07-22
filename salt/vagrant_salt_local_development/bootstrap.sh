#!/usr/bin/env bash

salt_repo="/srv/salt"

# python-dev required for build of pyzmq, perhaps other requirements
apt-get -y install python-pip
apt-get -y install python-dev

apt-get -y install python-m2crypto
pip install pyzmq PyYAML pycrypto msgpack-python jinja2 psutil
pip install -e $salt_repo

mkdir -p /etc/salt

cat > /etc/salt/minion <<EOF
file_client: local
user: root
root_dir: /
pidfile: /salt-minion.pid
secgroup.keyid: 
secgroup.key: 
EOF

# for testing additional modules
pip install boto
