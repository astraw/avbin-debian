# These would get set in build.sh
AVBIN_VERSION=7
FFMPEG_REVISION=13661

# $Id: Makefile 18 2008-04-13 06:18:31Z Alex.Holkner $

CFLAGS += -DAVBIN_VERSION=$(AVBIN_VERSION) \
          -DFFMPEG_REVISION=$(FFMPEG_REVISION)

CC = gcc
LD = ld
BUILDDIR = build
OUTDIR = dist/$(PLATFORM)

OBJNAME = $(BUILDDIR)/avbin.o

INCLUDE_DIRS = -I include

SONAME=libavbin.so.$(AVBIN_VERSION)
LIBNAME=$(OUTDIR)/$(SONAME)

CFLAGS += -fPIC -fno-stack-protector
LDFLAGS = -Bsymbolic-functions -shared -soname $(SONAME)

LIBS =

$(LIBNAME) : $(OBJNAME) $(OUTDIR)
	$(LD) $(LDFLAGS) -o $@ $< $(LIBS)

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
