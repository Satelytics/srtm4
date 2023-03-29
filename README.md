# Installation on MacOS
need to install libtiff by using 'brew install libtiff'
after that, check the libtiff location, they should contain header files and libs such as:
/opt/homebrew/Cellar/libtiff/4.4.0_1/include/tiffio.h
/opt/homebrew/Cellar/libtiff/4.4.0_1/lib/libtiff.dylib
In the Makefile.in file, we have the flags modified to allow the compiler to find the headers
and the linker to find the libraries. If those are not in the locations indicate below, you need
to make changes to the Makefile.in so that you can correctly install the srtm4
CFLAGS = -g -O3 -DNDEBUG -DDONT_USE_TEST_MAIN {cflags} -I/opt/homebrew/opt/libtiff/include
LDLIBS = -lstdc++ -lz -lm -L/opt/homebrew/opt/libtiff/lib -ltiff {ldflags}

after that, just run python setup.py install

# SRTM4 (Shuttle Radar Topography Mission)

Download and parsing of SRTM4 elevation data.

[![Build Status](https://travis-ci.com/cmla/srtm4.svg?branch=master)](https://travis-ci.com/cmla/srtm4)
[![PyPI version](https://img.shields.io/pypi/v/srtm4)](https://pypi.org/project/srtm4)

[Carlo de Franchis](mailto:carlo.de-franchis@cmla.ens-cachan.fr), Enric
Meinhardt, Gabriele Facciolo, CMLA 2018

# Installation and dependencies

The main source code repository for this project is https://github.com/cmla/srtm4.
It is written in Python. It was tested with Python 3.5, 3.6 and 2.7.

`srtm4` requires `libtiff` development files. They can be installed with
`apt-get install libtiff-dev` (Ubuntu, Debian) or `brew install libtiff`
(macOS).

Once `libtiff` is installed, `srtm4` can be installed with `pip`:

    pip install srtm4

# Usage

In a Python interpreter:

    >>> import srtm4
    >>> longitude, latitude = 2, 48
    >>> altitude = srtm4.srtm4(longitude, latitude)
    >>> print(altitude)  # should be 174.613 (altitude in meters above the WGS84 ellipsoid)

In a shell:

    GEOID_PATH=data ./bin/srtm4 2 48
