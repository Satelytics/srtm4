docker run --rm -v $(pwd):/io quay.io/pypa/manylinux2014_x86_64 bash -c "yum install -y libtiff-devel && cd /io && /opt/python/cp38-cp38/bin/python setup.py bdist_wheel"
# the wheel package will be in the dist folder
