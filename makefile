# Generic C Makefile
# Assumes src and obj subdirs. 
# Makes debug or release versions

CC=clang
CFLAGS=-g -Wall -Wextra
LDFLAGS=

SRC=src
OBJ=obj
HDRS=$(wildcard $(SRC)/*.h)
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

BINDIR=bin
BIN=$(BINDIR)/myapp

all: $(BIN)

release: CFLAGS=-Wall -Wextra -O2 -NDEBUG
release: clean
release: $(BIN)

$(BIN): $(OBJS) $(OBJ)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

$(OBJ)/%.o: $(SRC)/%.c $(OBJ)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ):
	mkdir -p $@

clean:
	$(RM) -r $(BINDIR)/* $(OBJ)/*