#
# Top Makefile
#

.PHONY: all clean mac linux windows debugger

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
all:
	$(MAKE) -C examples/mac all

clean:
	$(MAKE) -C examples/mac clean
else
all:
	$(MAKE) -C examples/linux all
	$(MAKE) -C examples/windows all
	$(MAKE) -C examples/debugger all

clean:
	$(MAKE) -C examples/linux clean
	$(MAKE) -C examples/windows clean
	$(MAKE) -C examples/debugger clean
endif

mac:
	$(MAKE) -C examples/mac all

linux:
	$(MAKE) -C examples/linux all

windows:
	$(MAKE) -C examples/windows all

debugger:
	$(MAKE) -C examples/debugger all
