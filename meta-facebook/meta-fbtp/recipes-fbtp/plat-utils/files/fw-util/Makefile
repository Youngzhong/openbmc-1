# Copyright 2015-present Facebook. All Rights Reserved.
all: fw-util

fw-util: fw-util.c
	$(CC) -pthread -lme -lgpio -lpal -lcpld -lbios -locpdbg-lcd -ljansson -std=c99 -o $@ $^ $(LDFLAGS)

.PHONY: clean

clean:
	rm -rf *.o fw-util
