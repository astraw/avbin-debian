# See http://sourceware.org/autobook/autobook/autobook_88.html
c_sources = avbin.c

INCLUDES = -I$(top_srcdir) -I../include -I/usr/include/libavformat -I/usr/include/libavcodec -I/usr/include/libavutil -I/usr/include/ffmpeg

lib_LTLIBRARIES= libavbin.la
libavbin_la_SOURCES= $(c_sources)
libavbin_la_CFLAGS= -DAVBIN_VERSION=7 -DFFMPEG_REVISION=13661
libavbin_la_LDFLAGS= -version-info 0:7:0 -release 7.0
libavbin_la_LIBADD= -lavutil -lavcodec -lavformat -lpostproc -lswscale
