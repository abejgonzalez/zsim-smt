#configure and build
CONFIGURE = ./configure.sh
SCONS = ${SCONSPATH}/bin/scons
SCONSFLAGS = -j4 --d

# testing
TESTDIR = ./tests/config
LOGDIR = ./log
TRACEDIR = ./tests/traces
PLOTDIR = ./tests/plots
PLOTSCRIPT = visual.py
TEST = $(TESTDIR)/smt.cfg
TEST1 = $(TESTDIR)/smt_branchgood1.cfg
TEST2 = $(TESTDIR)/smt_branchgood2.cfg
TEST3 = $(TESTDIR)/smt_branchgood3.cfg
TEST4 = $(TESTDIR)/smt_branchgood4.cfg
TEST5 = $(TESTDIR)/smt_branchgood5.cfg
TEST6 = $(TESTDIR)/smt_branchgood6.cfg
TEST7 = $(TESTDIR)/smt_data_cache_good1.cfg
TEST8 = $(TESTDIR)/smt_data_cache_good2.cfg
TEST9 = $(TESTDIR)/smt_data_cache_good3.cfg
TEST10 = $(TESTDIR)/smt_data_cache_good4.cfg
TEST11 = $(TESTDIR)/smt_data_cache_good5.cfg
TEST12 = $(TESTDIR)/smt_data_cache_good6.cfg
TEST13 = $(TESTDIR)/smt_data_cache_miss1.cfg
TEST14 = $(TESTDIR)/smt_data_cache_miss2.cfg
TEST15 = $(TESTDIR)/smt_data_cache_miss3.cfg
TEST16 = $(TESTDIR)/smt_data_cache_miss4.cfg
TEST17 = $(TESTDIR)/smt_data_cache_miss5.cfg
TEST18 = $(TESTDIR)/smt_data_cache_miss6.cfg
TEST19 = $(TESTDIR)/smt_i_cache_good1.cfg
TEST20 = $(TESTDIR)/smt_i_cache_good2.cfg
TEST21 = $(TESTDIR)/smt_i_cache_good3.cfg
TEST22 = $(TESTDIR)/smt_i_cache_good4.cfg
TEST23 = $(TESTDIR)/smt_i_cache_good5.cfg
TEST24 = $(TESTDIR)/smt_i_cache_good6.cfg
TEST25 = $(TESTDIR)/smt_i_cache_miss1.cfg
TEST26 = $(TESTDIR)/smt_i_cache_miss2.cfg
TEST27 = $(TESTDIR)/smt_i_cache_miss3.cfg
TEST28 = $(TESTDIR)/smt_i_cache_miss4.cfg
TEST29 = $(TESTDIR)/smt_i_cache_miss5.cfg
TEST30 = $(TESTDIR)/smt_i_cache_miss6.cfg
TEST31 = $(TESTDIR)/smt_misbranch1.cfg
TEST32 = $(TESTDIR)/smt_misbranch2.cfg
TEST33 = $(TESTDIR)/smt_misbranch3.cfg
TEST34 = $(TESTDIR)/smt_misbranch4.cfg
TEST35 = $(TESTDIR)/smt_misbranch5.cfg
TEST36 = $(TESTDIR)/smt_misbranch6.cfg
ZSIM = $(BUILDDIR)/debug/zsim

# outputs
BUILDDIR = build
LIBDIR = lib/
OUTPUT = heartbeat out.cfg *.out *.log* *.h5 .scons*

# pin
PINBIN = lib/pin2.14/intel64/bin/pinbin
PIN = $(BUILDDIR)/debug/pin

build: src/
	$(CONFIGURE)
	$(SCONS) $(SCONSFLAGS)
	# ln -sf ~/zsim/build/opt/zsim ~/opt/bin/zsim

clean:
	$(RM) -rf  $(BUILDDIR)  $(OUTPUT) $(TRACEDIR) $(LOGDIR)

test: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST)	
	mv *.log* log

test1: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST1)	
	mv *.log* log

test2: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST2)	
	mv *.log* log

test3: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST3)	
	mv *.log* log

test4: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST4)	
	mv *.log* log

test5: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST5)	
	mv *.log* log

test6: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST6)	
	mv *.log* log

test7: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST7)	
	mv *.log* log

test8: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST8)	
	mv *.log* log

test9: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST9)	
	mv *.log* log

test10: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST10)	
	mv *.log* log

test11: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST11)	
	mv *.log* log

test12: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST12)	
	mv *.log* log

test13: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST13)	
	mv *.log* log

test14: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST14)	
	mv *.log* log

test15: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST15)	
	mv *.log* log

test16: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST16)	
	mv *.log* log

test17: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST17)	
	mv *.log* log

test18: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST18)	
	mv *.log* log

test19: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST19)	
	mv *.log* log

test20: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST20)	
	mv *.log* log

test21: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST21)	
	mv *.log* log

test22: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST22)	
	mv *.log* log

test23: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST23)	
	mv *.log* log

test24: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST24)	
	mv *.log* log

test25: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST25)	
	mv *.log* log

test26: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST26)	
	mv *.log* log

test27: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST27)	
	mv *.log* log

test28: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST28)	
	mv *.log* log

test29: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST29)	
	mv *.log* log

test30: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST30)	
	mv *.log* log

test31: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST31)	
	mv *.log* log

test32: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST32)	
	mv *.log* log

test33: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST33)	
	mv *.log* log

test34: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST34)	
	mv *.log* log

test35: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST35)	
	mv *.log* log

test36: $(TEST) $(TRACEDIR) $(LOGDIR) $(PIN)
	$(ZSIM) $(TEST36)	
	mv *.log* log


test-clean:
	$(RM) -rf  $(OUTPUT) $(TRACEDIR) $(LOGDIR)

log-clean:
	$(RM) $(LOGDIR)/*

trace-clean:
	$(RM) -rf $(TRACEDIR)

plot: $(PLOTDIR) $(TRACEDIR)
	bash -c "cd tests && python $(PLOTSCRIPT)"

$(PIN):
	cp $(PINBIN) $(PIN)

$(TRACEDIR):
	mkdir -p $(TRACEDIR)

$(PLOTDIR):
	mkdir -p $(PLOTDIR)

$(LOGDIR):
	mkdir -p $(LOGDIR)

############### unit tests ######################

CC = g++
CPPFLAGS = -Ibuild/opt -g -std=c++11

testArbitration: tests/testArbitration.cpp build/opt/arbitration.o
	$(CC) $(CPPFLAGS) -o $@ $?
