CC = gcc
CFLAGS = -g -Wall -ansi
SRC = processor.c
OBJ = $(SRC:.c=.o)
BACKUP = $(SRC:.c=.c~)
MAIN = processor.exe
TEST = "ls -lah"

all: $(MAIN)
	@echo compiled the out of order processor ...

$(MAIN): $(OBJ)
	$(CC) $(CFLAGS) -o $(MAIN) $(OBJ)

test: $(MAIN)
	./$(MAIN) $(TEST) 

format: 
	indent $(SRC) -nbad -bap -nbc -bbo -hnl -br -brs -brf -c33 -cd33 -ncdb -ce -ci4 \
	-cli1 -d0 -di1 -nfc1 -i8 -ip0 -l120 -lp -npcs -nprs -npsl -sai \
	-saf -saw -ncs -nsc -sob -nfca -cp33 -ss -ts8 -il1
	$(RM) $(BACKUP)

clean:
	$(RM) $(MAIN) $(OBJ)



