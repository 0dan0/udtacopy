# Address-sanitizer library
ASAN_FLAGS := -lasan
ifneq ($(OS),Windows_NT)
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		# macOS requires different a flag
		ASAN_FLAGS := -fsanitize=address
	endif
endif

udtacopy : udtacopy.o 
		gcc -o udtacopy udtacopy.o $(ASAN_FLAGS)

udtacopy.o : udtacopy.c
		gcc -g -c udtacopy.c
clean :
		rm udtacopy udtacopy.o
