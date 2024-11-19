# Compiler and flags
CC = gcc
CFLAGS = -std=c11 -Wall

# SDL2 configuration for Linux
SDL2_FLAGS = `sdl2-config --cflags --libs`

# For Windows, manually set SDL2 paths if SDL2 is included in the repo
# You can comment this line if the SDL2 source is included directly in the repo.
SDL2_INCLUDE = include/SDL2
SDL2_LIB = src/SDL2

# The name of the output binary
OUTPUT = NaiveBayes

# Source and object files
SRC = src/main.c src/ali_hamo.c src/fadel_abderrahmen.c
OBJ = $(SRC:.c=.o)

# Build target
all: $(OUTPUT)

# Link object files with SDL2
$(OUTPUT): $(OBJ)
	$(CC) $(OBJ) -o $(OUTPUT) $(SDL2_FLAGS) -I$(SDL2_INCLUDE) -L$(SDL2_LIB) -lSDL2

# Compile source files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build files
clean:
	rm -f $(OBJ) $(OUTPUT)
