# $Id: Makefile 18 2008-04-13 06:18:31Z Alex.Holkner $

CFLAGS += -DAVBIN_VERSION=$(AVBIN_VERSION) \
          -DFFMPEG_REVISION=$(FFMPEG_REVISION)

CC = gcc
LD = ld
BUILDDIR = build
OUTDIR = dist/$(PLATFORM)

OBJNAME = $(BUILDDIR)/avbin.o

INCLUDE_DIRS = -I include \
               -I $(FFMPEG)

SONAME=libavbin.so.$(AVBIN_VERSION)
LIBNAME=$(OUTDIR)/$(SONAME)

CFLAGS += -fPIC -fno-stack-protector -O3
LDFLAGS += -shared -soname $(SONAME)

STATIC_LIBS = -whole-archive \
              $(FFMPEG)/libavformat/libavformat.a \
              $(FFMPEG)/libavcodec/libavcodec.a \
              $(FFMPEG)/libavutil/libavutil.a \
              -no-whole-archive

LIBS =

$(LIBNAME) : $(OBJNAME) $(OUTDIR)
	$(LD) $(LDFLAGS) -o $@ $< $(STATIC_LIBS) $(LIBS)

all : $(LIBNAME)
	ln -sf $(LIBNAME) $(LINKNAME)

$(OBJNAME) : src/avbin.c include/avbin.h $(BUILDDIR)
	$(CC) -c $(CFLAGS) $(INCLUDE_DIRS) -o $@ $<

$(BUILDDIR) :
	mkdir -p $(BUILDDIR)

$(OUTDIR) :
	mkdir -p $(OUTDIR)

clean : 
	rm -f $(OBJNAME)
	rm -f $(LINKNAME)
	rm -f $(LIBNAME)
