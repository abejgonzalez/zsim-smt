WSRC = $(wildcard *.cpp)
BACKUP = $(SRC:.cpp=.cpp~)

format: 
	@echo $(SRC)
	indent $(SRC) -nbad -bap -nbc -bbo -hnl -br -brs -brf -c33 -cd33 -ncdb -ce -ci4 \
	-cli1 -d0 -di1 -nfc1 -i8 -ip0 -l120 -lp -npcs -nprs -npsl -sai \
	-saf -saw -ncs -nsc -sob -nfca -cp33 -ss -ts8 -il1
	$(RM) $(BACKUP)

