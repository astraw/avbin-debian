#!/bin/sh
libtoolize --force \
&& autoheader \
&& aclocal \
&& automake --add-missing --foreign \
&& autoconf