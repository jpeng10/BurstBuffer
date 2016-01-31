# Update the following 3 variables for your own system:

CODES_BASE=/home/pj/projects/codes-base-0.4.1/install
CODES_NET=/home/pj/projects/codes-net-0.4.0/install
ROSS=/home/pj/projects/ROSS-master/install

ifndef CODES_BASE

$(error CODESBASE is undefined, see README.txt)

endif

ifndef CODES_NET

$(error CODESNET is undefined, see README.txt)

endif

ifndef ROSS

$(error ROSS is undefined, see README.txt)

 endif

CC = $(shell $(ROSS)/bin/ross-config --cc)

CFLAGS_ROSS=$(shell pkg-config --cflags $(ROSS)/lib/pkgconfig/ross.pc)
CFLAGS_CODES_BASE=$(shell pkg-config --cflags $(CODES_BASE)/lib/pkgconfig/codes-base.pc)
CFLAGS_CODES_NET=$(shell pkg-config --cflags $(CODES_NET)/lib/pkgconfig/codes-net.pc)
CFLAGS=$(CFLAGS_ROSS) $(CFLAGS_CODES_BASE) $(CFLAGS_CODES_NET)

LDFLAGS_ROSS=$(shell pkg-config --libs $(ROSS)/lib/pkgconfig/ross.pc)
LDFLAGS_CODES_BASE=$(shell pkg-config --libs $(CODES_BASE)/lib/pkgconfig/codes-base.pc)
LDFLAGS_CODES_NET=$(shell pkg-config --libs $(CODES_NET)/lib/pkgconfig/codes-net.pc)
LDFLAGS=$(LDFLAGS_ROSS) $(LDFLAGS_CODES_BASE) $(LDFLAGS_CODES_NET)

all:
	$(CC) $(CFLAGS) bb_sim.c -o bb_sim $(LDFLAGS)

test:
	@echo $(CC)
	@echo $(CPPFLAGS)
	@echo $(LDFLAGS)
	@echo $(LDLIBS)

.PHONY: clean
clean: 
	rm -f Burst_Buffers_new
