CC = gcc
CFLAGS = -Wall -Wextra -Werror -g
LIBRARIES = -lm

TARGET = main
MODULES = main

BIN_DIR = bin
SRC_DIR = src
OBJ_DIR = obj

all: $(BIN_DIR)/$(TARGET)

$(BIN_DIR)/$(TARGET): $(patsubst %, $(OBJ_DIR)/%.o, $(MODULES)) | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBRARIES)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

.PHONY: all clean
