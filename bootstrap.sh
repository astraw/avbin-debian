#!/bin/sh
#autoreconf -fvi
libtoolize --force \
&& autoheader \
&& aclocal \
&& automake --add-missing --foreign \
&& autoconf