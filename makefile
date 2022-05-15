# Generic C Makefile
# Assumes src, obj and bin subdirs. Makes debug or release versions

CC=clang
CFLAGS=-g -Wall -Wextra
LDFLAGS=

SRC=src
OBJ=obj
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

BINDIR=bin
# Change to the name of your executable
BIN=$(BINDIR)/myapp

all: $(BIN)

release: CFLAGS=-Wall -Wextra -O2 -DNDEBUG
release: clean
release: $(BIN)

$(BIN): $(OBJS) $(OBJ)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

$(OBJ)/%.o: $(SRC)/%.c $(SRC)/%.h $(OBJ)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ):
	mkdir -p $@

clean:
	$(RM) -r $(BINDIR)/* $(OBJ)/*
