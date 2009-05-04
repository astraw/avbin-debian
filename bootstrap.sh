#!/bin/sh
ln -sf /usr/share/aclocal/libtool.m4 aclocal.m4
libtoolize --force \
&& autoheader \
&& aclocal \
&& automake --add-missing --foreign \
&& autoconf
