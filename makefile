a:
	./configure.sh
	${SCONSPATH}/bin/scons -j16


clean:
	rm -rf lib/ build/
