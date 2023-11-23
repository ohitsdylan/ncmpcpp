CXXFLAGS = -DHAVE_CONFIG_H -DU_USING_ICU_NAMESPACE=0 -D_DEFAULT_SOURCE \
           -I. -I.. -Isrc -I/usr/include -I/usr/include/taglib \
		   -g -O2 -flto -ftree-vectorize -ffast-math -std=c++14
LIBS = -lboost_date_time -lboost_filesystem -lboost_locale -lboost_program_options \
       -lboost_regex -lboost_thread -lboost_system -licui18n -licuuc -licudata \
       -lmpdclient -lreadline -lpthread -lncursesw -lfftw3 -lcurl -L/usr/lib -ltag \
       -lz

SOURCES := $(shell find src -type f -iname "*.cpp")
OBJECTS := $(patsubst src/%.cpp,src/%.o,$(SOURCES))

all: ncmpcpp

ncmpcpp: $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJECTS) $(LIBS)

%.o: src/%.cpp Makefile
	$(CXX) $(CXXFLAGS) -c -o $@ $<

install: ncmpcpp
	install -Dm755 ncmpcpp       ${DESTDIR}${PREFIX}/ncmpcpp
	install -Dm755 doc/bindings  ${DESTDIR}${PREFIX}/doc/ncmpcpp/bindings
	install -Dm755 doc/config    ${DESTDIR}${PREFIX}/doc/ncmpcpp/config
	install -Dm755 doc/ncmpcpp.1 ${DESTDIR}${PREFIX}/doc/ncmpcpp/ncmpcpp.1

clean:
	rm -rf src/*.o ncmpcpp

.PHONY: all install clean
