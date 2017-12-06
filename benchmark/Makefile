CC = g++
CFLAGS = --std=c++11 -w
DEBUG_FLAGS = -DDEBUG_H
SIM_FLAGS = -DSIM_H
LINK = -lpthread

BIN = bench
SRC_DIR = src
SRC_CPU = $(SRC_DIR)/cpu.cpp
SRC_BENCH = $(SRC_DIR)/benchmark.cpp

SIM_DIR = zsim
BENCH = \
	$(SIM_DIR)/branch_good \
	$(SIM_DIR)/branch_miss \
	$(SIM_DIR)/dcache_good \
	$(SIM_DIR)/dcache_miss \
	$(SIM_DIR)/icache_good \
	$(SIM_DIR)/icache_miss 

all: opt
$(BIN): opt

opt: $(SRC_CPU) $(SRC_BENCH) # optimized
	$(CC) $(CFLAGS) $(SRC_CPU) $(SRC_BENCH) $(LINK) -o $(BIN)

debug: $(SRC_CPU) $(SRC_BENCH) # debugging
	$(CC) $(CFLAGS) $(DEBUG_FLAGS) $(SRC_CPU) $(SRC_BENCH) $(LINK) -o $(BIN)

sim: $(SRC_CPU) $(SRC_BENCH) # simulator
	$(CC) $(CFLAGS) $(SIM_FLAGS) $(SRC_CPU) $(SRC_BENCH) $(LINK) -o $(BIN)

zsim: $(BENCH)

$(BENCH): %:%.cpp $(SRC_BENCH)
	$(CC) $(CFLAGS) $(SIM_FLAGS) $< $(SRC_BENCH) $(LINK) -o $@

clean:
	$(RM) -f $(BIN) $(BENCH)
