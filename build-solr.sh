#!/bin/sh
version="4.1.0"
rm -rf BUILD RPMS SRPMS tmp || true
mkdir -p BUILD RPMS SRPMS

if [ ! -f SOURCES/solr-$version.tgz ];
then
    wget "http://apache.cu.be/lucene/solr/$version/solr-$version.tgz" -O SOURCES/solr-$version.tgz
fi

rpmbuild -ba --target=noarch --define="_topdir $PWD" --define="_tmppath $PWD/tmp" --define="ver $version" solr.spec
