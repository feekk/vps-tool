#!/usr/bin/bash

echo "--------------------Downloading package--------------------"
wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.11.4.tar.xz

echo "--------------------uncompress package--------------------"
tar -xf ocserv-0.11.4.tar.xz

echo "--------------------install dependence--------------------"
apt-get install build-essential pkg-config libgnutls28-dev libwrap0-dev libpam0g-dev libseccomp-dev libreadline-dev libnl-route-3-dev libev-dev gnutls-bin

echo "--------------------install ocserv--------------------"
cd ./ocserv-0.11.4
./configure
make
make install

echo "--------------------set config--------------------"
for file in /etc/ocserv/*
do
    if test -f $file
    then
        mv $file $file".old"
    fi
done

mkdir /etc/ocserv/
cp ../conf/ocserv.conf /etc/ocserv/ocserv.conf

mkdir certificates && cd certificates

echo 'cn = "feek"' >> ca.tmpl
echo 'organization = "feek_LA"' >> ca.tmpl
echo 'serial = 1' >> ca.tmpl
echo 'expiration_days = 3650' >> ca.tmpl
echo 'ca' >> ca.tmpl
echo 'signing_key' >> ca.tmpl
echo 'cert_signing_key' >> ca.tmpl
echo 'crl_signing_key' >> ca.tmpl
certtool --generate-privkey --outfile ca-key.pem
certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem

echo 'cn = "202.5.16.95"' >> server.tmpl
echo 'organization = "feek_LA"' >> server.tmpl
echo 'expiration_days = 3650' >> server.tmpl
echo 'signing_key' >> server.tmpl
echo 'encryption_key' >> server.tmpl
echo 'tls_www_server' >> server.tmpl
certtool --generate-privkey --outfile server-key.pem
certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem

cp ca-cert.pem /etc/ssl/private/my-ca-cert.pem
cp server-cert.pem /etc/ssl/private/my-server-cert.pem
cp server-key.pem /etc/ssl/private/my-server-key.pem



echo "--------------------install done--------------------"
echo "--------------------Usage--------------------"
echo "create User: sudo ocpasswd -c /etc/ocserv/ocpasswd your-username"


